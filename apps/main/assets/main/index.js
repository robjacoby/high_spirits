/**
 * Your JavaScript goes here.

var Promise = require('es6-promise').Promise;
import FontFaceObserver from 'fontfaceobserver';

var fontsToCheck = [
  {
    family: '',
    style: '',
    weight: ''
  }
];

function fontsLoaded (fontsToCheck) {
  var timeout = 1500;
  var fontsLoaded = window.localStorage.getItem('fontsLoaded');

  if (!fontsLoaded) {
    var loading = fontsToCheck.map( function (font) {
      const observer = new FontFaceObserver(font.family, {
        weight: font.weight,
        style: font.style,
      });
      return observer.load(null, timeout);
    });
    Promise.all(loading).then(() => {
      window.document.documentElement.className += ' fonts-loaded';
      window.localStorage.setItem('fontsLoaded', true);
    }, () => {
      window.document.documentElement.className += ' fonts-loaded';
    })
  }
}

fontsLoaded(fontsToCheck);
 */
