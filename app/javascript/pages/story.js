const getLocation = ()=> {
  const photo_upload_button = document.getElementById('story_photos');
  if (photo_upload_button) {
    photo_upload_button.addEventListener('click', () => {
      console.log('Photo Upload Button clicked');
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(setLocation, displayError);
      } else {
        alert("Geolocation not supported by browser");
      }
    });
  }
}

export { getLocation };

const setLocation = (location) => {
  if (location) {
    const latitude_input = document.getElementById('story_latitude');
    latitude_input.value = location.coords.latitude;

    const longitude_input = document.getElementById('story_longitude');
    longitude_input.value = location.coords.longitude;
    console.log('Latitude' + latitude_input);
  }
}

export { setLocation };

const displayError = (error) => {
  const errors =  {
    1: 'Permission denied',
    2: 'Position unavailable',
    3: 'Request timeout'
  };

  if (error) {
    const geolocation_notice = document.getElementById('geolocation_notice');
    geolocation_notice.innerHTML = `Unable to fetch Geolocation: ${errors[error.code]}`;
  }
}

export { displayError };
