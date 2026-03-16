
import React from 'react';

const Footer: React.FC = () => {
  return (
    <footer className="bg-black border-t border-white/5 py-16 md:py-24">
      <div className="container mx-auto px-4 md:px-10">
        <div className="flex flex-col md:flex-row justify-between items-center gap-12 md:gap-0">
          <div className="text-center md:text-left">
            <p className="font-cinzel text-2xl md:text-3xl font-bold text-white tracking-tight">
              SSK <span className="text-[#FF6600]">PEOPLE</span>
            </p>
            <p className="mt-4 text-[10px] font-black uppercase tracking-[0.4em] text-gray-500">
              Global Community Registry Node
            </p>
          </div>
          
          <div className="flex flex-col items-center md:items-end gap-6">
            <div className="text-center md:text-right">
              <p className="text-[10px] font-black uppercase tracking-[0.3em] text-gray-500 mb-2">Managed By</p>
              <p className="text-sm text-white font-medium">SSK Samaj Bangalore Organisations</p>
            </div>
            
            <div className="text-center md:text-right">
              <p className="text-[10px] font-black uppercase tracking-[0.3em] text-gray-500 mb-2">Volunteer Support</p>
              <a href="tel:+918884449689" className="text-lg md:text-xl font-bold text-[#FF6600] hover:text-orange-400 transition-colors">
                +91 888 444 9689
              </a>
            </div>
          </div>
        </div>
        
        <div className="mt-16 md:mt-24 pt-8 border-t border-white/5 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-[9px] font-black uppercase tracking-[0.2em] text-gray-700">
            &copy; {new Date().getFullYear()} SSKPEOPLE.COM • ALL RIGHTS RESERVED
          </p>
          <div className="flex gap-8">
            <span className="text-[9px] font-black uppercase tracking-[0.2em] text-gray-700">Privacy Protocol</span>
            <span className="text-[9px] font-black uppercase tracking-[0.2em] text-gray-700">Network Status: Online</span>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
