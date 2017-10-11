# Phoenix Component Folders

[![CircleCI](https://circleci.com/gh/kimlindholm/phoenix_component_folders/tree/master.svg?style=shield)](https://circleci.com/gh/kimlindholm/phoenix_component_folders/tree/master)
[![Ebert](https://ebertapp.io/github/kimlindholm/phoenix_component_folders.svg)](https://ebertapp.io/github/kimlindholm/phoenix_component_folders)
[![codebeat badge](https://codebeat.co/badges/bb4bb0c2-e08c-4c13-b1a3-07b5f354a071)](https://codebeat.co/projects/github-com-kimlindholm-phoenix_component_folders-master)
[![Dependency Status](https://www.versioneye.com/user/projects/59cdfd98368b083214208a92/badge.svg?style=shield)](https://www.versioneye.com/user/projects/59cdfd98368b083214208a92)

Reusable UI components on Phoenix framework

> Quick tutorial and demo app

## Description

If you're using Phoenix to render rich UI components (à la React or Vue), it might be more convenient to group all related code and tests into separate component folders and to make use of some view helpers:

<p align="center">
  <img alt="Phoenix Component Folders Screenshot" width="832"
       src="https://user-images.githubusercontent.com/1413569/30855028-af376c5c-a2dd-11e7-9eb1-c4ddad3e6313.png" />
</p>

Here's how to do it on **Phoenix 1.3**. If you're using version 1.2, just note some minor changes like replacing path `lib/my_app_web` with `web`.

## Tutorial

### Step 1: Add `component_helpers.ex`

Grab file [`component_helpers.ex`](https://github.com/kimlindholm/phoenix_component_folders/blob/master/lib/phoenix_component_folders_web/components/component_helpers.ex) and place it in new folder `lib/my_app_web/components`.

### Step 2: Edit `lib/my_app_web.ex`

```diff
-  def view do
+  def view(opts \\
+      [root: "lib/my_app_web/templates",
+       namespace: MyAppWeb]) do
     quote do
-      use Phoenix.View, root: "lib/my_app_web/templates",
-                        namespace: MyAppWeb
+      use Phoenix.View, unquote(opts)

       # etc...

       import MyAppWeb.Gettext
+      import MyAppWeb.Components.ComponentHelpers
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

Next, you'll need to add a view for each component _namespace_. For instance, as in the screen shot above, for namespace `:comment_feed` you'd create file `lib/my_app_web/components/comment_feed/comment_feed_view.ex`:

```elixir
defmodule MyAppWeb.Components.CommentFeedView do
  alias MyAppWeb.Components.ComponentHelpers
  use MyAppWeb, {:view, ComponentHelpers.view_opts(:comment_feed)}
end
```

### Done

That's it. Now you're ready to add some templates. See commits [Add example components](https://github.com/kimlindholm/phoenix_component_folders/commit/cf1552a6975208a712cbf1e6f94f4e54fe2903f0) and [Migrate example components to the new 1.3 directory structure](https://github.com/kimlindholm/phoenix_component_folders/commit/3960fc08b6f6158154cd32c0920da4a7d1c904d0) for a minimal example and add controllers / channels to your UI components as needed. Let's finish up with some usage examples:

```eex
<%= c :comment_feed, :comments, assigns %>   <!-- pass all assigns from controller -->
<%= c :comment_feed, :reply_form %>          <!-- no assigns -->
<%= c :comment_feed %>                       <!-- default to index.html.eex template -->
```

In all the code above, remember to replace occurences of `MyApp`, `my_app`, `PhoenixComponentFolders` and `phoenix_component_folders` with your app's name.

## Original Articles and Code

- [Reusable Templates in Phoenix](http://blog.danielberkompas.com/2017/01/17/reusable-templates-in-phoenix.html)
- [Gist: ComponentHelpers](https://gist.github.com/kana-sama/491ae1bd75974797d2bcb43c7489abf9)
- [Phoenix Feature Folders](https://medium.com/@tliversidge/phoenix-feature-folders-179e4dbc1e8a)

## Demo App

### Requirements

* Phoenix 1.3.0 or later
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