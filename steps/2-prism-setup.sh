#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh 
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 2. prism.js セットアップ

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/***********.patch # <pre><code>でソースコードを表示
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![2022-07-20_09h11_44.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/07f77b7b-35b3-c4f6-89a5-d0ed49892101.png)

# ソースコードが白黒で表示されたので、次はprism.jsを使って色をつけていきます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
(cd && npm install prismjs)
git apply patches/***********.patch # import prism.js + 空のuseEffect
# ```

# :white_check_mark: Result: 以下のようなエラーが表示されます。

# ```shell
# ```

# このエラーを解決しましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
npm install --save-dev @types/prismjs
# ```

# :white_check_mark: Result: エラーは解消されました

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/***********.patch # highlightElement + useRef
# ```

# <details><summary>highlightElement vs. highlightAll</summary><div>

# ---

# </div></details>


# :white_check_mark: Result: ハイライトされません。

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ffe58180-312b-eb56-e4d3-65daa8e5d9db.png)

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
npm install babel-plugin-prismjs
git apply patches/***********.patch # babel plugin in package.json
# ```

# :white_check_mark: Result: 以下のように表示されればOKです

# ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/ffe58180-312b-eb56-e4d3-65daa8e5d9db.png)
