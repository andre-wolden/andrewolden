import React from 'react';
import './App.css';
import {BrowserRouter as Router, Route} from "react-router-dom";
import Home from "./home";
import About from "./about";
import Contact from "./contact";
import Footer from "./footer";
import Header from "./header";

const App: React.FC = () => {
    return (
        <div className="App">
            <Router>
                <Header/>
                <Route path={"/about"} component={About}/>
                <Route path={"/contact"} component={Contact}/>
                <Route path={"/"} exact component={Home}/>
                <Footer/>
            </Router>
        </div>
    );
};

export default App;
