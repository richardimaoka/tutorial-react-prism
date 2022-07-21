#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 2. prism.js セットアップ

# まずはprism.jsを入れない状態でソースコードを表示しましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/1b41a5d.patch # <pre><code>...</code></pre> でソースコードを表示
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-07-20_09h11_44.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/07f77b7b-35b3-c4f6-89a5-d0ed49892101.png)

# ソースコードが白黒で表示されたので、次はprism.jsを使って色をつけていきます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
(cd app && npm install prismjs)
git apply patches/295fa81.patch # highlightElement
# ```

# :white_check_mark: Result: App.tsxが以下のようになります。

# ```tsx
# import Prism from "prismjs";
# import { useEffect, useRef } from "react";

# function App() {
#   const codeString = `...` //JavaScript code string

#   const ref = useRef<HTMLElement>(null);
#   useEffect(() => {
#     if (ref.current) {
#       Prism.highlightElement(ref.current);
#     }
#   }, []);
#   return (
#     <pre>
#       <code className="language-js" ref={ref}>
#         {codeString}
#       </code>
#     </pre>
#   );
# }

# export default App;
# ```

# <details><summary>highlightElement vs. highlightAll</summary><div>

# prism.jsには [highlightElement](https://prismjs.com/docs/Prism.html#.highlightElement) 以外にも [highlightAll](https://prismjs.com/docs/Prism.html#.highlightAll) というAPI functionもあります。
# highlightAllはその名の通りHTML document内のすべての `class="language-xxx"` となっている要素に対して highlightElement 呼び出すのと同等です。Reactを使わない静的なWebページであれば、document全体に対してhighlightAllを呼び出すほうが楽でわかりやすいでしょう。
# highlightElementは、一つの要素を対象にsyntax highlightを行います。本記事でhighlightElement利用したのは、Reactらしくコンポーネント内でのuseEffectの影響をコンポーネント内に閉じておきたかったからです。
# 
# 
# ---

# </div></details>

# :white_check_mark: Result: `import Prism from "prismjs"` の部分で以下のようなエラーが表示されます。

# > Could not find a declaration file for module 'prismjs'. 'tutorial-react-prismjs/app/node_modules/prismjs/prism.js' implicitly has an 'any' type.
# > Try `npm i --save-dev @types/prismjs` if it exists or add a new declaration (.d.ts) file containing `declare module 'prismjs';`ts(7016)

# このエラーを解消しましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
npm install --save-dev @types/prismjs
# ```

# :white_check_mark: Result: エラーは解消されました。しかし、コードはまだsyntax highlightされません。

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ffe58180-312b-eb56-e4d3-65daa8e5d9db.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/c35d06d.patch # import "prismjs/themes/prism-twilight.css";
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ffe58180-312b-eb56-e4d3-65daa8e5d9db.png)
