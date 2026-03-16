-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Organisations Table
CREATE TABLE organisations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    secretary_name TEXT NOT NULL,
    mobile TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Active',
    profile_photo_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Profiles Table (Extends Auth Users)
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    email TEXT NOT NULL,
    organisation_id UUID REFERENCES organisations(id),
    mobile TEXT,
    status TEXT NOT NULL DEFAULT 'Active',
    password_reset_pending BOOLEAN DEFAULT FALSE,
    profile_photo_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Members Table
CREATE TABLE members (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    aadhaar TEXT NOT NULL UNIQUE,
    mobile TEXT NOT NULL,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    father_name TEXT NOT NULL,
    dob DATE NOT NULL,
    gender TEXT NOT NULL,
    marital_status TEXT NOT NULL,
    qualification TEXT NOT NULL,
    emergency_contact TEXT NOT NULL,
    pincode TEXT NOT NULL,
    address TEXT NOT NULL,
    previous_address TEXT,
    address_proof_url TEXT,
    death_certificate_url TEXT,
    aadhaar_front_url TEXT NOT NULL,
    aadhaar_back_url TEXT NOT NULL,
    occupation TEXT NOT NULL,
    support_need TEXT NOT NULL,
    volunteer_id UUID REFERENCES profiles(id),
    organisation_id UUID REFERENCES organisations(id),
    submission_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    status TEXT NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE organisations ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE members ENABLE ROW LEVEL SECURITY;

-- Policies for Organisations
CREATE POLICY "Public organisations are viewable by everyone" ON organisations
    FOR SELECT USING (true);

CREATE POLICY "Only MasterAdmin can insert/update/delete organisations" ON organisations
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid() AND profiles.role = 'MasterAdmin'
        )
    );

-- Policies for Profiles
CREATE POLICY "Profiles are viewable by everyone" ON profiles
    FOR SELECT USING (true);

CREATE POLICY "Users can update their own profile" ON profiles
    FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Only MasterAdmin can manage profiles" ON profiles
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid() AND profiles.role = 'MasterAdmin'
        )
    );

-- Policies for Members
CREATE POLICY "Members are viewable by everyone" ON members
    FOR SELECT USING (true);

CREATE POLICY "Volunteers can insert members" ON members
    FOR INSERT WITH CHECK (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid() AND profiles.role = 'Volunteer'
        )
    );

CREATE POLICY "Volunteers can update their own pending members" ON members
    FOR UPDATE USING (
        auth.uid() = volunteer_id AND status = 'Pending'
    );

CREATE POLICY "MasterAdmin and Organisations can manage members" ON members
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid() AND (profiles.role = 'MasterAdmin' OR profiles.role = 'Organisation')
        )
    );
