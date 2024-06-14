import React from 'react';
import Layout from '../layout';
// import Layout from '../components/layout';

const Dashboard: React.FC = () => {
  return (
    <Layout>
      <div className="flex">
        <nav className="w-1/4 bg-white shadow p-4">
          <ul>
            <li className="mb-2"><a href="#" className="text-blue-600">Dashboard</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Payment Info</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Registration</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Courses</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Drop Semester</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Result</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Notice</a></li>
            <li className="mb-2"><a href="#" className="text-gray-600">Schedule</a></li>
            <li><a href="#" className="text-gray-600">Logout</a></li>
          </ul>
        </nav>
        <section className="w-3/4 p-4">
          <div className="bg-white shadow p-4 mb-4">
            <h2 className="text-2xl mb-2">Welcome back, Student!</h2>
            <p className="text-gray-600">Always stay updated in your student portal.</p>
          </div>
          <div className="grid grid-cols-3 gap-4">
            <div className="bg-white shadow p-4">
              <h3 className="text-xl">Finance</h3>
              <div className="mt-2">
                <p>Total Payable: 20000</p>
                <p>Total Aid: 5000</p>
                <p>Others: 1300</p>
              </div>
            </div>
            <div className="bg-white shadow p-4">
              <h3 className="text-xl">Enrolled Courses</h3>
              <ul className="mt-2">
                <li>Object Oriented Programming</li>
                <li>Fundamentals of Database Systems</li>
              </ul>
            </div>
            <div className="bg-white shadow p-4">
              <h3 className="text-xl">Course Instructors</h3>
              <ul className="mt-2">
                <li>Instructor 1</li>
                <li>Instructor 2</li>
              </ul>
            </div>
          </div>
          <div className="bg-white shadow p-4 mt-4">
            <h3 className="text-xl">Daily Notice</h3>
            <p className="mt-2">Prelim payment due...</p>
          </div>
        </section>
      </div>
    </Layout>
  );
};

export default Dashboard;
