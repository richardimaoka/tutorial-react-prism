import "./App.css";
import Prism from "prismjs";
import { useEffect, useRef } from "react";

function App() {
  const ref = useRef<HTMLElement>(null);
  useEffect(() => {
    if (ref.current) {
      Prism.highlightElement(ref.current);
    }
  }, []);
  const codeString = `import React, { useState } from 'react';

function Example() {
  // Declare a new state variable, which we'll call "count"
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}`;
  return (
    <div>
      <pre className="language-javascript">
        <code ref={ref}>{codeString}</code>
      </pre>
    </div>
  );
}

export default App;
