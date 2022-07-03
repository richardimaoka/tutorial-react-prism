import "./App.css";
import Prism from "prismjs";
import { useEffect } from "react";

function App() {
  useEffect(() => {
    Prism.highlightAll();
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
        <code>{codeString}</code>
      </pre>
    </div>
  );
}

export default App;
