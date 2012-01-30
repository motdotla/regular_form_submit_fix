var RegularFormSubmitFix;
RegularFormSubmitFix = function(app) {
  app.defaultCheckFormSubmission = this._checkFormSubmission;
  return app._checkFormSubmission = function(form) {
    var $form, path, verb;
    $form = $(form);
    path = $form.attr("action");
    verb = this._getFormVerb($form);
    if (verb === "get" && path[0] !== "#") {
      return true;
    } else {
      return this.defaultCheckFormSubmission(form);
    }
  };
};