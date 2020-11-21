import folium
map_pts = folium.Map(location=[51.5, -0.15], zoom_start=12)
for idx, row in stations_to_examine.iterrows():
    folium.Marker(location=[row['latitude'], row['longitude']],
                  popup=row['station_name']).add_to(map_pts)
