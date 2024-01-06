import React, { useState } from "react";
import "./App.css";
import Board from "./components/Board";

const App = () => {
  const [history, setHistory] = useState([
    { squares: Array(9).fill(null), player: "X", winner: null },
  ]);
  const [stepNumber, setStepNumber] = useState(0);

  const current = history[stepNumber];

  const calculateWinner = (squares) => {
    const lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (let i = 0; i < lines.length; i++) {
      const [a, b, c] = lines[i];
      if (
        squares[a] &&
        squares[a] === squares[b] &&
        squares[b] === squares[c]
      ) {
        return squares[a];
      }
    }
    return null;
  };

  const handleClick = (i) => {
    const newHistory = history.slice(0, stepNumber + 1);
    const newCurrent = newHistory[newHistory.length - 1];
    const newSquares = newCurrent.squares.slice();
    const tmpWin = newCurrent.winner;
    if (tmpWin !== null) return;

    if (newSquares[i] === null) {
      if (stepNumber % 2) {
        newCurrent.player = "O";
      } else {
        newCurrent.player = "X";
      }
      newSquares[i] = newCurrent.player;
      newCurrent.winner = calculateWinner(newSquares);

      setHistory([
        ...newHistory,
        {
          squares: newSquares,
          player: newCurrent.player,
          winner: newCurrent.winner,
        },
      ]);
      setStepNumber(newHistory.length);
    }
  };

  const jumpTo = (step) => {
    setStepNumber(step);
  };

  const moves = history.map((step, move) => {
    const desc = move ? "Go to move #" + move : "Go to game start";
    return (
      <li key={move}>
        <button className="move-button" onClick={() => jumpTo(move)}>
          {desc}
        </button>
      </li>
    );
  });

  return (
    <div className="game">
      <h1>Tic Tac Toe</h1>
      <div className="game-board">
        <Board squares={current} step={stepNumber} onClick={(i) => handleClick(i) } />
      </div>
      <div className="game-info">
        <div>{moves}</div>
      </div>
    </div>
  );
};

export default App;
