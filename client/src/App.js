import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Fib from './Fib';
import Otherpage from './Otherpage'
function App() {
	return (
		<Router>
			<div className="App">
				<header className="App-header">
					<img src={logo} className="App-logo" alt="logo" />
					<Link to="/">Home</Link>
					<Link to="/otherpage">Other page</Link>
				</header>
				<div>
					<Route exact path="/" component={Fib}></Route>
					<Route exact path="/otherpage" component={Otherpage}></Route>
				</div>
			</div>
		</Router>
	);
}

export default App;
