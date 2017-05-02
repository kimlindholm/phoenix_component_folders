defmodule PhoenixComponentFolders.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use PhoenixComponentFolders.Web, :controller
      use PhoenixComponentFolders.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: PhoenixComponentFolders.Web
      import Plug.Conn
      import PhoenixComponentFolders.Web.Router.Helpers
      import PhoenixComponentFolders.Web.Gettext
    end
  end

  def view(opts \\
      [root: "lib/phoenix_component_folders/web/templates",
       namespace: PhoenixComponentFolders.Web]) do
    quote do
      use Phoenix.View, unquote(opts)

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import PhoenixComponentFolders.Web.Router.Helpers
      import PhoenixComponentFolders.Web.ErrorHelpers
      import PhoenixComponentFolders.Web.Gettext
      import PhoenixComponentFolders.Web.Components.ComponentHelpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import PhoenixComponentFolders.Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
  defmacro __using__({which, opts}) when is_atom(which) do
    apply(__MODULE__, which, [opts])
  end
end
