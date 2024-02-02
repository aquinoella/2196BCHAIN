import React from "react"
import './app.css';

function Correct(){
    return <p className ="green"> Correct! </p>
}
function InCorrect(){
    return <p className ="red">Incorrect!</p>
}

const isCorrect = true;

function CorrectorIncorrect(props){
    const isCorrect = props.isCorrect;
    //return isCorrect ? <Correct/> : <InCorrect/>
if (isCorrect === true){
    return Correct
}
if (isCorrect === false){
    return < Incorrect/>
}
else{
    return null
}
}

export default function BibleQuiz(){
    return(
        <div>
            <h3>The Bible Quiz</h3>
            <p>The Bible consists of the Old and New Testaments.</p>
            <CorrectorIncorrect isCorrect={true}/>
            <p>Moses led the Israelites out of Egypt.</p>
            <CorrectorIncorrect isCorrect={true}/>
            <p>The Sermon on the Mount is found in the Book of Luke.</p>
            <CorrectorIncorrect isCorrect={false}/>

            <button>Show Answer</button>
        </div>
    );
}
