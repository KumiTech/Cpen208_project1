import React from 'react';

interface LayoutProps {
  children: React.ReactNode;
}

const Layout: React.FC<LayoutProps> = ({ children }) => {
  return (
    <div className="min-h-screen bg-gray-100 flex flex-col">
      <header className="bg-blue-600 p-4 text-white">
        <h1 className="text-xl">Student Portal</h1>
      </header>
      <main className="flex-grow p-4">{children}</main>
      <footer className="bg-gray-800 p-4 text-white text-center">
        &copy; 2024 Student Portal
      </footer>
    </div>
  );
};

export default Layout;