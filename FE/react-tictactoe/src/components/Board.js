import React from "react";
import Square from "./Square";
import "./Board.css";

const Board = ({ squares, step, onClick }) => {
  const renderSquare = (i) => {
    return <Square value={squares.squares[i]} onClick={() => onClick(i)} />;
  };

  const player = step % 2? "O" : "X";

  const status = `Next player: ${player}`;
  const win = `Winner is: ${squares.winner}`;

  return (
    <div>
      <div className="board-wrapper">
        <div className="board-row">
          {renderSquare(0)}
          {renderSquare(1)}
          {renderSquare(2)}
        </div>
        <div className="board-row">
          {renderSquare(3)}
          {renderSquare(4)}
          {renderSquare(5)}
        </div>
        <div className="board-row">
          {renderSquare(6)}
          {renderSquare(7)}
          {renderSquare(8)}
        </div>
      </div>
      {squares.winner === null && <div className="status">{status}</div>}
      {squares.winner !== null && <div className="winner">{win}</div>}
    </div>
  );
};

export default Board;
