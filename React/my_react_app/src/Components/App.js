import React from 'react'
import ReactDOM from 'react-dom'
import BlogPost from './BlogPost.js'

class App extends React.Component {
    constructor(props){
        super(props)
        this.state = {mood: 'Optimistic!'}
    }

    render(){
        return(
            <div>
                {this.state.mood}
                <BlogPost />
            </div>
        )
    }
}

export default App