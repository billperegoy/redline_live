defmodule RedlineLiveWeb.PageLive do
  use RedlineLiveWeb, :live_view

  alias RedlineLive.Map

  @impl true
  def mount(_params, _session, socket) do
    regions = Map.list_regions()

    {:ok, assign(socket, regions: regions, expanded_regions: [])}
  end

  def handle_event(
        "toggle_region_visibility",
        %{"value" => region_id_str},
        socket = %{assigns: %{expanded_regions: expanded_regions}}
      ) do
    {region_id, _} = Integer.parse(region_id_str)

    expanded_regions =
      if region_id in expanded_regions do
        List.delete(expanded_regions, region_id)
      else
        [region_id | expanded_regions]
      end

    {:noreply, assign(socket, expanded_regions: expanded_regions)}
  end

  def expand_region?(region_id, expanded_regions) do
    region_id in expanded_regions
  end

  def region_button_text(region_id, expanded_regions) do
    if region_id in expanded_regions, do: "close", else: "open"
  end
end
