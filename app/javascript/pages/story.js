// GEOCODING

const getLocation = (image_button) => {
  image_button.addEventListener('click', () => {
    console.log('Photo Upload Button clicked');
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(setLocation, displayError);
    } else {
      alert("Geolocation not supported by browser");
    }
  });
}

export { getLocation };

const setLocation = (location) => {
  if (location) {
    const latitude_input = document.getElementById('story_latitude');
    latitude_input.value = location.coords.latitude;
    console.log('Latitude: ' + latitude_input.value);

    const longitude_input = document.getElementById('story_longitude');
    longitude_input.value = location.coords.longitude;
    console.log('Longitude: ' + longitude_input.value);
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
    const geolocation_notice = document.getElementById('js-geolocation_notice');
    geolocation_notice.innerHTML = `Unable to fetch Geolocation: ${errors[error.code]}`;
  }
}

export { displayError };

// PHOTO UPLOAD

const getPhotos = (image_button) => {
  image_button.addEventListener('change', () => {
    const photos = image_button.files;
    const image_button_label = document.querySelector('label[for=story_photos]');

    // Read uploaded photos
    const reader = new FileReader();
    reader.onload = ()=> {
      image_button_label.setAttribute('style', `background-image: url(${reader.result});`);
    }
    if (photos[0]) {
      reader.readAsDataURL(photos[0]);
    } else {
    }
  });
}

export { getPhotos };
