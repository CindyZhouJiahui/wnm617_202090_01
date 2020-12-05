

const makeMap = async(target, center={ lat: 37.786229, lng: -122.399287 }) => {
	await checkData(()=>window.google);

	let map_el = $(target);

	if(!map_el.data("map")) map_el.data({
			"map": new google.maps.Map(map_el[0], {
				center: center,
				zoom: 12,
				styles: mapStyles,
				disableDefaultUI: true
			}),
			"infoWindow": new google.maps.InfoWindow({content:""})
	});

	// map_el.data("map") is the same as the map variable in demos

	return map_el;
}



const makeMarkers = (map_el,map_locs) => {

	let map = map_el.data("map");
	let markers = map_el.data("markers");

	if(markers) markers.forEach(o=>o.setMap(null));

	markers = [];

	map_locs.forEach((o,i,a)=>{
		let m = new google.maps.Marker({
			position: o,
			map: map_el.data("map"),
			icon: {
				// expects location object to have .icon property
				url: o.icon,
				scaledSize: {
					width:40,
					height:40
				}
			}
		});
		markers.push(m);
	});

	map_el.data("markers",markers);

	setTimeout(()=>setMapBounds(map_el.data("map"),map_locs), 100);
}

const makeMarkers2 = (map_el,map_locs) => {

    let map = map_el.data("map");
    let markers = map_el.data("markers");

    if(markers) markers.forEach(o=>o.setMap(null));

    markers = [];

    map_locs.forEach((o,i,a)=>{
        let m = new google.maps.Marker({
            position: o,
            map: map_el.data("map"),
            icon: {
                // expects location object to have .icon property
                url: o.photo,
                scaledSize: {
                    width:40,
                    height:40
                }
            }
        });
        markers.push(m);
    });

    map_el.data("markers",markers);

    setTimeout(()=>setMapBounds(map_el.data("map"),map_locs), 100);
}


const setMapBounds = (map,map_locs) => {
	if(map_locs.length==1) {
		map.setCenter(map_locs[0]);
		map.setZoom(14);
	} else if(map_locs.length==0) {
		if(window.location.protocol!=="https:") return;
		else {
			navigator.geolocation.getCurrentPosition(p=>{
				let pos = {
					lat:p.coords.latitude,
					lng:p.coords.longitude
				}
				map.setCenter(pos);
				map.setZoom(15);
			},(...args)=>{
				console.log("Error?",args);
			},{
				enableHighAccuracy:false,
				timeout:5000,
				maximumAge:0
			});
		}
	} else {
		let bounds = new google.maps.LatLngBounds(null);
		map_locs.forEach(o=>{
			bounds.extend(o)
		});
		map.fitBounds(bounds);
	}
}




const mapStyles =[
    {
        "featureType": "water",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#aee2e0"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#abce83"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#769E72"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#7B8758"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#EBF4A4"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "simplified"
            },
            {
                "color": "#8dab68"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#5B5B3F"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ABCE83"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#A4C67D"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#9BBF72"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry",
        "stylers": [
            {
                "color": "#EBF4A4"
            }
        ]
    },
    {
        "featureType": "transit",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "color": "#87ae79"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#7f2200"
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#ffffff"
            },
            {
                "visibility": "on"
            },
            {
                "weight": 4.1
            }
        ]
    },
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#495421"
            }
        ]
    },
    {
        "featureType": "administrative.neighborhood",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    }
]