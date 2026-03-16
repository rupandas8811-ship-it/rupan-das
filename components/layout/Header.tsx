import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';

const Header: React.FC<{ isLandingPage?: boolean }> = ({ isLandingPage = false }) => {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  return (
    <header className="w-full bg-black/80 py-6 md:py-8 sticky top-0 z-[100] border-b border-white/5 backdrop-blur-xl">
      <div className="container mx-auto px-4 md:px-10 flex justify-between items-center">
        <Link to="/" className="flex items-center group">
          <span className="text-xl md:text-3xl font-bold text-white font-cinzel tracking-tight group-hover:tracking-widest transition-all duration-500">
            SSK <span className="text-[#FF6600]">PEOPLE</span>
          </span>
        </Link>
        
        <div className="flex items-center gap-6 md:gap-10">
          {user ? (
            <div className="flex items-center gap-6">
              <div className="hidden md:flex flex-col items-end">
                <span className="text-[9px] font-black uppercase tracking-widest text-gray-500">Authenticated as</span>
                <span className="text-[11px] font-bold text-white uppercase tracking-tight">{user.name}</span>
              </div>
              <button 
                onClick={logout}
                className="px-6 md:px-10 py-2.5 md:py-3 bg-white/5 border border-white/10 text-white text-[9px] md:text-[10px] font-black uppercase rounded-full tracking-[0.3em] hover:bg-white hover:text-black transition-all duration-300"
              >
                Terminate Session
              </button>
            </div>
          ) : (
            <button 
              onClick={() => navigate('/login')}
              className="px-8 md:px-12 py-2.5 md:py-3 bg-[#FF6600] text-white text-[9px] md:text-[10px] font-black uppercase rounded-full tracking-[0.3em] hover:bg-orange-500 hover:shadow-[0_0_30px_rgba(255,102,0,0.3)] transition-all duration-300"
            >
              Access Terminal
            </button>
          )}
        </div>
      </div>
    </header>
  );
};

export default Header;