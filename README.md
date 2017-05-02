# Phoenix Component Folders

Reusable UI components on Phoenix framework

> Quick tutorial and demo app

## Description

If you're using Phoenix to render rich UI components (à la React or Vue), it might be more convenient to group all related code and tests into separate component folders and to make use of some view helpers:

<p align="center">
  <img alt="Phoenix Component Folders Screenshot" src="https://cloud.githubusercontent.com/assets/1413569/25590614/7896ae5e-2edb-11e7-9d5c-d4a11e234726.png">
</p>

Here's how to do it on **Phoenix 1.3**. If you're using version 1.2, just note some minor changes like replacing path `lib/my_app/web` with `web`.

## Tutorial

### Step 1: Add `component_helpers.ex`

Grab file [`component_helpers.ex`](https://github.com/kimlindholm/phoenix_component_folders/blob/master/lib/phoenix_component_folders/web/components/component_helpers.ex) and place it in new folder `lib/my_app/web/components`.

### Step 2: Edit `web.ex`

```diff
-  def view do
+  def view(opts \\
+      [root: "lib/my_app/web/templates",
+       namespace: MyApp.Web]) do
     quote do
-      use Phoenix.View, root: "lib/my_app/web/templates",
-                        namespace: MyApp.Web
+      use Phoenix.View, unquote(opts)

       # etc...

       import MyApp.Web.Gettext
+      import MyApp.Web.Components.ComponentHelpers
     end
   end

   # etc...

   defmacro __using__(which) when is_atom(which) do
     apply(__MODULE__, which, [])
   end
+  defmacro __using__({which, opts}) when is_atom(which) do
+    apply(__MODULE__, which, [opts])
+  end
 end
```

### Step 3: Add View

Next, you'll need to add a view for each component _namespace_. For instance, as in the screen shot above, for namespace `:comment_feed` you'd create file `lib/my_app/web/components/comment_feed/comment_feed_view.ex`:

```elixir
defmodule MyApp.Web.Components.CommentFeedView do
  alias MyApp.Web.Components.ComponentHelpers
  use MyApp.Web, {:view, ComponentHelpers.view_opts(:comment_feed)}
end
```

### Done

That's it. Now you're ready to add some templates. See commit [Add example components](https://github.com/kimlindholm/phoenix_component_folders/commit/cf1552a6975208a712cbf1e6f94f4e54fe2903f0) for a minimal example and add controllers / channels to your UI components as needed.

In all the code above, remember to replace occurences of `MyApp`, `my_app`, `PhoenixComponentFolders` and `phoenix_component_folders` with your app's name.

## Original Articles and Code

- [Reusable Templates in Phoenix](http://blog.danielberkompas.com/2017/01/17/reusable-templates-in-phoenix.html)
- [Gist: ComponentHelpers](https://gist.github.com/kana-sama/491ae1bd75974797d2bcb43c7489abf9)
- [Phoenix Feature Folders](https://medium.com/@tliversidge/phoenix-feature-folders-179e4dbc1e8a)

## Demo App

### Requirements

* Phoenix 1.3.0-rc or later
* Elixir 1.4 or later
* Erlang 19 or later

### Installation

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix s`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## License

See [LICENSE](LICENSE).