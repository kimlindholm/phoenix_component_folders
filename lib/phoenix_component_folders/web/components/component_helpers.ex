defmodule PhoenixComponentFolders.Web.Components.ComponentHelpers do
  alias PhoenixComponentFolders.Web.Components
  alias Phoenix.Naming

  @moduledoc """
  Conveniences for reusable UI components
  """

  def c(namespace, name \\ :index, assigns \\ []) do
    component(namespace, template(name), assigns)
  end

  def c(namespace, name, assigns, opts) do
    component(namespace, template(name), assigns, opts)
  end

  def component(namespace, template, assigns) do
    apply(
      view(namespace),
      :render,
      [template, assigns]
    )
  end

  def component(namespace, template, assigns, do: block) do
    apply(
      view(namespace),
      :render,
      [template, Keyword.merge(assigns, [do: block])]
    )
  end

  def view_opts(namespace) do
    %{root: "lib/phoenix_component_folders/web/components/#{namespace}/templates",
      namespace: PhoenixComponentFolders.Web,
      path: ""}
  end

  defp view(name) do
    module_name = Naming.camelize("#{name}") <> "View"
    Module.concat(Components, module_name)
  end

  defp template(name) when is_atom(name) do
    "#{name}.html"
  end
end
