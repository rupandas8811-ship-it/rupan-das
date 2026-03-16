-- Seed Organisations
INSERT INTO organisations (id, name, secretary_name, mobile, status)
VALUES 
    ('00000000-0000-0000-0000-000000000001', 'SSK Central Hub', 'Arjun Kumar', '9876543210', 'Active'),
    ('00000000-0000-0000-0000-000000000002', 'SSK South Division', 'Soma Shekar', '9876543211', 'Active');

-- Seed Profiles (Note: In a real Supabase setup, these would need to be linked to auth.users)
-- For demonstration purposes, we'll assume these IDs exist in auth.users
-- INSERT INTO profiles (id, name, role, email, organisation_id, mobile, status)
-- VALUES 
--     ('11111111-1111-1111-1111-111111111111', 'Master Admin', 'MasterAdmin', 'admin@ssk.com', NULL, '9999999999', 'Active'),
--     ('22222222-2222-2222-2222-222222222222', 'Volunteer One', 'Volunteer', 'volunteer1@ssk.com', '00000000-0000-0000-0000-000000000001', '8888888888', 'Active');

-- Seed Members
INSERT INTO members (aadhaar, mobile, name, surname, father_name, dob, gender, marital_status, qualification, emergency_contact, pincode, address, occupation, support_need, organisation_id, status)
VALUES 
    ('123456789012', '9000000001', 'Ramesh', 'S', 'Suresh', '1985-05-15', 'Male', 'Married', 'Graduate', '9000000002', '560001', '123, Main St, Bangalore', 'Engineer', 'Education', '00000000-0000-0000-0000-000000000001', 'Accepted'),
    ('234567890123', '9000000003', 'Sita', 'K', 'Krishna', '1990-08-20', 'Female', 'Married', 'Post Graduate', '9000000004', '560002', '456, Cross Rd, Bangalore', 'Doctor', 'Medical', '00000000-0000-0000-0000-000000000002', 'Accepted'),
    ('345678901234', '9000000005', 'Amit', 'P', 'Prakash', '1995-12-10', 'Male', 'Single', 'Secondary School', '9000000006', '560003', '789, Park Ave, Bangalore', 'Student', 'Job', '00000000-0000-0000-0000-000000000001', 'Pending');
