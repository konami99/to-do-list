import React, { useEffect } from "react";
import { useParams } from "react-router-dom";

const Show = () => {
  const { id } = useParams();

  return (
    <h1 className="text-4xl font-bold underline">Show todo {id}</h1>
  );
}

export default Show;