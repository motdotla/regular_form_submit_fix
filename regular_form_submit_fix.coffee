# @credits to Fabien Baligand and patrick.delanauze
RegularFormSubmitFix = (app) ->
  app.defaultCheckFormSubmission = @_checkFormSubmission
  app._checkFormSubmission = (form) ->
    $form = $(form)
    path  = $form.attr("action")
    verb  = @_getFormVerb($form)
    if verb is "get" and path[0] isnt "#"
      false
    else
      @defaultCheckFormSubmission form