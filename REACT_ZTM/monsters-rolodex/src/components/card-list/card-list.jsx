import React from 'react'
import './card-list.style.css'
import {Card} from '../card/card.component'

export const CardList = (props) => {
    return(
    <div className="card-list">
        {props.monsters.map((m) => ( 
            <Card monster={m} key={m.id}/>
            // <h1 >{m.name}</h1>
        ))}
    </div>)
    
}