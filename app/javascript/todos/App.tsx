import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Index from "./Index";
import Show from "./Show";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Index />} />
        <Route path="/todo/:id" element={<Show />} />
      </Routes>
    </Router>
  );
};

export default App;