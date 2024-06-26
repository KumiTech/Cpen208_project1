import React from 'react';

const Header: React.FC = () => {
  return (
    <header className="flex justify-between items-center p-4 bg-gray-200">
      <div className="text-xl font-bold">Your School Logo</div>
      <div className="flex items-center">
        <input
          type="text"
          placeholder="Search"
          className="p-2 border border-gray-300 rounded mr-4"
        />
        <button className="p-2 border-none rounded bg-blue-500 text-white cursor-pointer">Search</button>
      </div>
      <div className="flex items-center">
        <span className="mr-4">Hi, Avina D.</span>
        <button className="p-2 border-none rounded bg-gray-200 cursor-pointer">Logout</button>
      </div>
    </header>
  );
};

export default Header;
