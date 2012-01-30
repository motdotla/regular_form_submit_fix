# @credits to Fabien Baligand and patrick.delanauze at http://groups.google.com/group/sammyjs/browse_thread/thread/1185bed98824df3f/252f162e3abbbd79
RegularFormSubmitFix = (app) ->
  app.defaultCheckFormSubmission = @_checkFormSubmission
  app._checkFormSubmission = (form) ->
    $form = $(form)
    path  = $form.attr("action")
    verb  = @_getFormVerb($form)
    return true if verb is "get" and path[0] isnt "#"
    @defaultCheckFormSubmission form