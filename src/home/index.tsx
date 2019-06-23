import React from 'react';

const Home: React.FC = () => {

    return (
        <div>
            <span>
                <div className={"profile_picture_circle"}>
                    <img src={"5.jpg"} className={"my-picture"} alt="logo"/>
                </div>
            </span>
                <p>
                    Andre Wolden
                </p>
                <a
                    className="App-link"
                    href="http://hlogg.herokuapp.com"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    Hobby Logger
                </a>
        </div>)
};

export default Home;
