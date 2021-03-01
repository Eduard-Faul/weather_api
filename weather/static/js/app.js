function getWeather() {
    $("#results").empty();
    let res = getLatLong($('address').value)
    if (!res.err) {
        let result;
        try {
            $.ajax({
                'async': false,
                'type': "GET",
                'global': false,
                'url': `weather/current?lat=${res.lat}&long=${res.long}`,
                'data': {},
                'success': function (data) {
                    result = data;
                }
            });
        } catch (error) {
            console.log(error);
        }
        $('.loading-spinner').css('visibility','hidden');

        cardBuilder(result);
        // save variable to access in the save function
        localStorage.setItem("weather_json", JSON.stringify(result));

        $('#save').prop('disabled', false);
    } else {
        console.log('getLatLong error');
    }
}
function save() {
    let result;
    let weather_json = JSON.parse(localStorage.getItem("weather_json"));
    try {
        $.ajax({
            'async': true,
            'type': "POST",
            'url': `weather/saveWeather`,
            'data': JSON.stringify({ weather_json: weather_json }),
            'contentType': "application/json; charset=utf-8",
            'dataType': "json",
            'success': function (data) {
                result = data;
            }
        });
    } catch (error) {
        console.log(error);
    }
    $('.loading-spinner').css('visibility','hidden');
    console.log(result);
}

function prevResults() {
    $("#results").empty();
    let result;
    try {
        $.ajax({
            'async': false,
            'type': "GET",
            'url': `weather/getAllWeather`,
            'data': {},
            'success': function (data) {
                result = data;
            }
        });
    } catch (error) {
        console.log(error);
    }
    $('.loading-spinner').css('visibility','hidden');

    for (let k in result) {
        var response_json = result[k].fields.response_json;
        var response_json = JSON.parse(response_json);
        cardBuilder(response_json);
    }
}

function getLatLong(address) {
    var result, lat, long;
    try {
        $.ajax({
            'async': false,
            'type': "GET",
            'global': false,
            'url': "weather/getLatLong?address=" + address,
            'data': {},
            'success': function (data) {
                result = data;
            }
        }); 
    } catch (error) {
        console.log(error);
    }
    
    lat = result[0].geometry.coordinates[1];
    long = result[0].geometry.coordinates[0];
    if (lat && long) {
        return { 'lat': lat, 'long': long, 'err': false };
    } else {
        return { 'lat': null, 'long': null, 'err': true };
    }
}

function cardBuilder(params) {
    var wind_arr = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW', 'N'] //add another 'N' since it needs to round to North if close to 0 and close to 360
    //get the closest corresponding direction using degrees
    var wind_dir = wind_arr[Math.round((params.wind.deg / 45)-0.25)];
    $("#results").append(`
    <div class="col">
        <div class="card"> 
            <span class="icon">
                <img class="img-fluid" src="http://openweathermap.org/img/w/${params.weather[0].icon}.png"/>
            </span>
            <div class="row">
                <div class="col">
                    <div class="header title">${params.name}
                    </div>
                    <div class="temp">${params.main.temp}&deg;C</div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="header">General</div>
                    <div class="value">${params.weather[0].description}</div>
                </div>
                <div class="col">
                    <div class="header">Min Temperature</div>
                    <div class="value">${params.main.temp_min}&deg;C</div>
                </div>
                <div class="col">
                    <div class="header">Max Temperature</div>
                    <div class="value">${params.main.temp_max}&deg;C</div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="header">Humidity</div>
                    <div class="value">${params.main.humidity}%</div>
                </div>
                <div class="col">
                    <div class="header">Clouds</div>
                    <div class="value">${params.clouds.all}%</div>
                </div>
                <div class="col">
                    <div class="header">Wind</div>
                    <div class="value">${wind_dir} <svg style="transform: rotate(${params.wind.deg - 45}deg)" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cursor-fill" viewBox="0 0 16 16">
                    <path d="M14.082 2.182a.5.5 0 0 1 .103.557L8.528 15.467a.5.5 0 0 1-.917-.007L5.57 10.694.803 8.652a.5.5 0 0 1-.006-.916l12.728-5.657a.5.5 0 0 1 .556.103z"/>
                    </svg> ${params.wind.speed} m/s</div>
                </div>
            </div>
        </div>
    </div>`)
}


$("#getWeather").on("mousedown", function () {
    $('.loading-spinner').css('visibility','visible');
    getWeather()
})
$("#save").on("mousedown", function () {
    $('.loading-spinner').css('visibility','visible');
    save()
})
$("#prevResults").on("mousedown", function () {
    $('.loading-spinner').css('visibility','visible');
    prevResults()
})