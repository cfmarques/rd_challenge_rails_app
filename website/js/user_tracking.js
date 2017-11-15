var UserTracking = (function () {
  var Storage = {
    _get: function (key) {
      return JSON.parse(localStorage.getItem(key));
    },

    _set: function (key, value) {
      var stringifyValue = JSON.stringify(value);
      localStorage.setItem(key, stringifyValue);
    },

    userEmail: function () {
      console.log('user email returned!');
      return this._get('userEmail');
    },

    trackingDataList: function () {
      var trackingDataList = this._get('trackingDataList') || [];
      this._set('trackingDataList', trackingDataList);
      console.log('tracking data returned!');
      return trackingDataList;
    },

    saveUserEmail: function (userEmail) {
      this._set('userEmail', userEmail);
      console.log('user email saved!');
    },

    addTrackingData: function (trackingData) {
      var trackingDataList = this.trackingDataList();
      trackingDataList.push(trackingData);
      this._set('trackingDataList', trackingDataList);
      console.log('tracking data added!');
    },

    cleanTrackingDataList: function () {
      this._set('trackingDataList', []);
      console.log('tracking data cleanned!');
    }
  };

  var init = function () {
    trackUserOrSaveData();
    bindSendContactButton();
  };

  var currentPage = function () {
    return window.location.href;
  };

  var currentDateTime = function () {
    return new Date().toLocaleString();
  };

  var currentTrackingData = function () {
    return {
      page: currentPage(),
      dateTime: currentDateTime()
    };
  };

  var trackUser = function () {
    var trackingData = currentTrackingData(),
      userEmail = Storage.userEmail();

    if (!trackingData || !userEmail) return;

    console.log('User tracked!');

    // makeRequest({
    //   url: '',
    //   method: 'POST',
    //   onSucess: onTrackUserSuccess
    // });
  };

  var trackUserOrSaveData = function () {
    if (Storage.userEmail()) {
      trackUser();
    } else {
      Storage.addTrackingData(currentTrackingData());
    }
  };

  var sendContactButtonClicked = function () {
    var userEmailInput = document.getElementById('user_tracking_user_email'),
      userEmail = '';

    if (!userEmailInput) return;

    userEmail = userEmailInput.value;

    if (Storage.userEmail()) {
      Storage.cleanTrackingDataList();
    }

    Storage.saveUserEmail(userEmail);
    trackUser();
    Storage.cleanTrackingDataList();
  };

  var bindSendContactButton = function () {
    var sendContactButton = document.getElementById('user_tracking_send_contact'),
      that = this;

    if (!sendContactButton) return;

    sendContactButton.addEventListener('click', function () {
      sendContactButtonClicked();
    });
  };

  var onTrackUserSuccess = function () {
    console.log('User tracked with success!');
  };

  var makeRequest = function (args) {
    var url = args.url || '',
      method = args.method || 'GET',
      onSuccess = args.onSuccess || function () {},
      httpRequest = new XMLHttpRequest();

    httpRequest.onreadystatechange = function () {
      var COMPLETE = 4,
        OK = 200;

      if (!this.readyState === COMPLETE || !this.status == OK) return;
      onSucess();
    };

    httpRequest.open(method, url, true);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    httpRequest.send();
  };

  return {
    init: init
  };
})();

window.addEventListener("load", UserTracking.init);
