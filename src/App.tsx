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
  const codeString = `class Main {
  public static void main(String[] args) {

    int base = 3, exponent = 4;

    long result = 1;

    while (exponent != 0) {
      result *= base;
      --exponent;
    }

    System.out.println("Answer = " + result);
  }
}`;
  return (
    <div>
      <pre className="language-java">
        <code ref={ref}>{codeString}</code>
      </pre>
    </div>
  );
}

export default App;
