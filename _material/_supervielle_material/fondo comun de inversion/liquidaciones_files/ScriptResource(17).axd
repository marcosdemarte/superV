﻿Type.registerNamespace("AjaxControlToolkit");AjaxControlToolkit.BehaviorBase=function(c){var b=null,a=this;AjaxControlToolkit.BehaviorBase.initializeBase(a,[c]);a._clientStateFieldID=b;a._pageRequestManager=b;a._partialUpdateBeginRequestHandler=b;a._partialUpdateEndRequestHandler=b};AjaxControlToolkit.BehaviorBase.prototype={initialize:function(){AjaxControlToolkit.BehaviorBase.callBaseMethod(this,"initialize")},dispose:function(){var a=this;AjaxControlToolkit.BehaviorBase.callBaseMethod(a,"dispose");if(a._pageRequestManager){if(a._partialUpdateBeginRequestHandler){a._pageRequestManager.remove_beginRequest(a._partialUpdateBeginRequestHandler);a._partialUpdateBeginRequestHandler=null}if(a._partialUpdateEndRequestHandler){a._pageRequestManager.remove_endRequest(a._partialUpdateEndRequestHandler);a._partialUpdateEndRequestHandler=null}a._pageRequestManager=null}},get_ClientStateFieldID:function(){return this._clientStateFieldID},set_ClientStateFieldID:function(a){if(this._clientStateFieldID!=a){this._clientStateFieldID=a;this.raisePropertyChanged("ClientStateFieldID")}},get_ClientState:function(){if(this._clientStateFieldID){var a=document.getElementById(this._clientStateFieldID);if(a)return a.value}return null},set_ClientState:function(b){if(this._clientStateFieldID){var a=document.getElementById(this._clientStateFieldID);if(a)a.value=b}},registerPartialUpdateEvents:function(){var a=this;if(Sys&&Sys.WebForms&&Sys.WebForms.PageRequestManager){a._pageRequestManager=Sys.WebForms.PageRequestManager.getInstance();if(a._pageRequestManager){a._partialUpdateBeginRequestHandler=Function.createDelegate(a,a._partialUpdateBeginRequest);a._pageRequestManager.add_beginRequest(a._partialUpdateBeginRequestHandler);a._partialUpdateEndRequestHandler=Function.createDelegate(a,a._partialUpdateEndRequest);a._pageRequestManager.add_endRequest(a._partialUpdateEndRequestHandler)}}},_partialUpdateBeginRequest:function(){},_partialUpdateEndRequest:function(){}};AjaxControlToolkit.BehaviorBase.registerClass("AjaxControlToolkit.BehaviorBase",Sys.UI.Behavior);AjaxControlToolkit.DynamicPopulateBehaviorBase=function(c){var b=null,a=this;AjaxControlToolkit.DynamicPopulateBehaviorBase.initializeBase(a,[c]);a._DynamicControlID=b;a._DynamicContextKey=b;a._DynamicServicePath=b;a._DynamicServiceMethod=b;a._cacheDynamicResults=false;a._dynamicPopulateBehavior=b;a._populatingHandler=b;a._populatedHandler=b};AjaxControlToolkit.DynamicPopulateBehaviorBase.prototype={initialize:function(){var a=this;AjaxControlToolkit.DynamicPopulateBehaviorBase.callBaseMethod(a,"initialize");a._populatingHandler=Function.createDelegate(a,a._onPopulating);a._populatedHandler=Function.createDelegate(a,a._onPopulated)},dispose:function(){var a=this;if(a._populatedHandler){a._dynamicPopulateBehavior&&a._dynamicPopulateBehavior.remove_populated(a._populatedHandler);a._populatedHandler=null}if(a._populatingHandler){a._dynamicPopulateBehavior&&a._dynamicPopulateBehavior.remove_populating(a._populatingHandler);a._populatingHandler=null}if(a._dynamicPopulateBehavior){a._dynamicPopulateBehavior.dispose();a._dynamicPopulateBehavior=null}AjaxControlToolkit.DynamicPopulateBehaviorBase.callBaseMethod(a,"dispose")},populate:function(b){var a=this;if(a._dynamicPopulateBehavior&&a._dynamicPopulateBehavior.get_element()!=$get(a._DynamicControlID)){a._dynamicPopulateBehavior.dispose();a._dynamicPopulateBehavior=null}if(!a._dynamicPopulateBehavior&&a._DynamicControlID&&a._DynamicServiceMethod){a._dynamicPopulateBehavior=$create(AjaxControlToolkit.DynamicPopulateBehavior,{id:a.get_id()+"_DynamicPopulateBehavior",ContextKey:a._DynamicContextKey,ServicePath:a._DynamicServicePath,ServiceMethod:a._DynamicServiceMethod,cacheDynamicResults:a._cacheDynamicResults},null,null,$get(a._DynamicControlID));a._dynamicPopulateBehavior.add_populating(a._populatingHandler);a._dynamicPopulateBehavior.add_populated(a._populatedHandler)}a._dynamicPopulateBehavior&&a._dynamicPopulateBehavior.populate(b?b:a._DynamicContextKey)},_onPopulating:function(b,a){this.raisePopulating(a)},_onPopulated:function(b,a){this.raisePopulated(a)},get_dynamicControlID:function(){return this._DynamicControlID},get_DynamicControlID:this.get_dynamicControlID,set_dynamicControlID:function(b){var a=this;if(a._DynamicControlID!=b){a._DynamicControlID=b;a.raisePropertyChanged("dynamicControlID");a.raisePropertyChanged("DynamicControlID")}},set_DynamicControlID:this.set_dynamicControlID,get_dynamicContextKey:function(){return this._DynamicContextKey},get_DynamicContextKey:this.get_dynamicContextKey,set_dynamicContextKey:function(b){var a=this;if(a._DynamicContextKey!=b){a._DynamicContextKey=b;a.raisePropertyChanged("dynamicContextKey");a.raisePropertyChanged("DynamicContextKey")}},set_DynamicContextKey:this.set_dynamicContextKey,get_dynamicServicePath:function(){return this._DynamicServicePath},get_DynamicServicePath:this.get_dynamicServicePath,set_dynamicServicePath:function(b){var a=this;if(a._DynamicServicePath!=b){a._DynamicServicePath=b;a.raisePropertyChanged("dynamicServicePath");a.raisePropertyChanged("DynamicServicePath")}},set_DynamicServicePath:this.set_dynamicServicePath,get_dynamicServiceMethod:function(){return this._DynamicServiceMethod},get_DynamicServiceMethod:this.get_dynamicServiceMethod,set_dynamicServiceMethod:function(b){var a=this;if(a._DynamicServiceMethod!=b){a._DynamicServiceMethod=b;a.raisePropertyChanged("dynamicServiceMethod");a.raisePropertyChanged("DynamicServiceMethod")}},set_DynamicServiceMethod:this.set_dynamicServiceMethod,get_cacheDynamicResults:function(){return this._cacheDynamicResults},set_cacheDynamicResults:function(a){if(this._cacheDynamicResults!=a){this._cacheDynamicResults=a;this.raisePropertyChanged("cacheDynamicResults")}},add_populated:function(a){this.get_events().addHandler("populated",a)},remove_populated:function(a){this.get_events().removeHandler("populated",a)},raisePopulated:function(b){var a=this.get_events().getHandler("populated");a&&a(this,b)},add_populating:function(a){this.get_events().addHandler("populating",a)},remove_populating:function(a){this.get_events().removeHandler("populating",a)},raisePopulating:function(b){var a=this.get_events().getHandler("populating");a&&a(this,b)}};AjaxControlToolkit.DynamicPopulateBehaviorBase.registerClass("AjaxControlToolkit.DynamicPopulateBehaviorBase",AjaxControlToolkit.BehaviorBase);AjaxControlToolkit.ControlBase=function(b){var a=this;AjaxControlToolkit.ControlBase.initializeBase(a,[b]);a._clientStateField=null;a._callbackTarget=null;a._onsubmit$delegate=Function.createDelegate(a,a._onsubmit);a._oncomplete$delegate=Function.createDelegate(a,a._oncomplete);a._onerror$delegate=Function.createDelegate(a,a._onerror)};AjaxControlToolkit.ControlBase.__doPostBack=function(c,b){if(!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack())for(var a=0;a<AjaxControlToolkit.ControlBase.onsubmitCollection.length;a++)AjaxControlToolkit.ControlBase.onsubmitCollection[a]();Function.createDelegate(window,AjaxControlToolkit.ControlBase.__doPostBackSaved)(c,b)};AjaxControlToolkit.ControlBase.prototype={initialize:function(){var b="undefined",a=this;AjaxControlToolkit.ControlBase.callBaseMethod(a,"initialize");a._clientStateField&&a.loadClientState(a._clientStateField.value);if(typeof Sys.WebForms!==b&&typeof Sys.WebForms.PageRequestManager!==b){Array.add(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements,a._onsubmit$delegate);if(AjaxControlToolkit.ControlBase.__doPostBackSaved==null||typeof AjaxControlToolkit.ControlBase.__doPostBackSaved==b){AjaxControlToolkit.ControlBase.__doPostBackSaved=window.__doPostBack;window.__doPostBack=AjaxControlToolkit.ControlBase.__doPostBack;AjaxControlToolkit.ControlBase.onsubmitCollection=[]}Array.add(AjaxControlToolkit.ControlBase.onsubmitCollection,a._onsubmit$delegate)}else $addHandler(document.forms[0],"submit",a._onsubmit$delegate)},dispose:function(){var b="undefined",a=this;if(typeof Sys.WebForms!==b&&typeof Sys.WebForms.PageRequestManager!==b){Array.remove(AjaxControlToolkit.ControlBase.onsubmitCollection,a._onsubmit$delegate);Array.remove(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements,a._onsubmit$delegate)}else $removeHandler(document.forms[0],"submit",a._onsubmit$delegate);AjaxControlToolkit.ControlBase.callBaseMethod(a,"dispose")},findElement:function(a){return $get(this.get_id()+"_"+a.split(":").join("_"))},get_clientStateField:function(){return this._clientStateField},set_clientStateField:function(b){var a=this;if(a.get_isInitialized())throw Error.invalidOperation(AjaxControlToolkit.Resources.ExtenderBase_CannotSetClientStateField);if(a._clientStateField!=b){a._clientStateField=b;a.raisePropertyChanged("clientStateField")}},loadClientState:function(){},saveClientState:function(){return null},_invoke:function(g,d,h){var a=this;if(!a._callbackTarget)throw Error.invalidOperation(AjaxControlToolkit.Resources.ExtenderBase_ControlNotRegisteredForCallbacks);if(typeof WebForm_DoCallback==="undefined")throw Error.invalidOperation(AjaxControlToolkit.Resources.ExtenderBase_PageNotRegisteredForCallbacks);for(var e=[],b=0;b<d.length;b++)e[b]=d[b];var c=a.saveClientState();if(c!=null&&!String.isInstanceOfType(c))throw Error.invalidOperation(AjaxControlToolkit.Resources.ExtenderBase_InvalidClientStateType);var f=Sys.Serialization.JavaScriptSerializer.serialize({name:g,args:e,state:a.saveClientState()});WebForm_DoCallback(a._callbackTarget,f,a._oncomplete$delegate,h,a._onerror$delegate,true)},_oncomplete:function(a,b){a=Sys.Serialization.JavaScriptSerializer.deserialize(a);if(a.error)throw Error.create(a.error);this.loadClientState(a.state);b(a.result)},_onerror:function(a){throw Error.create(a);},_onsubmit:function(){if(this._clientStateField)this._clientStateField.value=this.saveClientState();return true}};AjaxControlToolkit.ControlBase.registerClass("AjaxControlToolkit.ControlBase",Sys.UI.Control);
Type.registerNamespace('AjaxControlToolkit');AjaxControlToolkit.Resources={"PasswordStrength_InvalidWeightingRatios":"Strength Weighting ratios must have 4 elements","HTMLEditor_toolbar_button_FontSize_defaultValue":"default","HTMLEditor_toolbar_button_DesignMode_title":"Design mode","Animation_ChildrenNotAllowed":"AjaxControlToolkit.Animation.createAnimation cannot add child animations to type \"{0}\" that does not derive from AjaxControlToolkit.Animation.ParentAnimation","PasswordStrength_RemainingSymbols":"{0} symbol characters","HTMLEditor_toolbar_button_FixedForeColor_title":"Foreground color","HTMLEditor_toolbar_popup_LinkProperties_field_URL":"URL","ExtenderBase_CannotSetClientStateField":"clientStateField can only be set before initialization","HTMLEditor_toolbar_button_Bold_title":"Bold","RTE_PreviewHTML":"Preview HTML","HTMLEditor_toolbar_popup_LinkProperties_button_OK":"OK","HTMLEditor_toolbar_button_JustifyRight_title":"Justify Right","RTE_JustifyCenter":"Justify Center","PasswordStrength_RemainingUpperCase":"{0} more upper case characters","HTMLEditor_toolbar_popup_LinkProperties_button_Cancel":"Cancel","Animation_TargetNotFound":"AjaxControlToolkit.Animation.Animation.set_animationTarget requires the ID of a Sys.UI.DomElement or Sys.UI.Control.  No element or control could be found corresponding to \"{0}\"","AsyncFileUpload_UnhandledException":"Unhandled Exception","RTE_FontColor":"Font Color","RTE_LabelColor":"Label Color","Common_InvalidBorderWidthUnit":"A unit type of \"{0}\"\u0027 is invalid for parseBorderWidth","HTMLEditor_toolbar_button_JustifyFull_title":"Justify","RTE_Heading":"Heading","AsyncFileUpload_ConfirmToSeeErrorPage":"Do you want to see the response page?","Tabs_PropertySetBeforeInitialization":"{0} cannot be changed before initialization","HTMLEditor_toolbar_button_StrikeThrough_title":"Strike through","RTE_OrderedList":"Ordered List","HTMLEditor_toolbar_button_OnPastePlainText":"Plain text pasting is switched on. Just now: {0}","HTMLEditor_toolbar_button_RemoveLink_title":"Remove Link","HTMLEditor_toolbar_button_FontName_defaultValue":"default","HTMLEditor_toolbar_button_FontName_label":"Font","ReorderList_DropWatcherBehavior_NoChild":"Could not find child of list with id \"{0}\"","CascadingDropDown_MethodTimeout":"[Method timeout]","RTE_Columns":"Columns","RTE_InsertImage":"Insert Image","RTE_InsertTable":"Insert Table","RTE_Values":"Values","RTE_OK":"OK","ExtenderBase_PageNotRegisteredForCallbacks":"This Page has not been registered for callbacks","HTMLEditor_toolbar_button_InsertLink_title":"Insert/Edit URL link","Animation_NoDynamicPropertyFound":"AjaxControlToolkit.Animation.createAnimation found no property corresponding to \"{0}\" or \"{1}\"","Animation_InvalidBaseType":"AjaxControlToolkit.Animation.registerAnimation can only register types that inherit from AjaxControlToolkit.Animation.Animation","RTE_UnorderedList":"Unordered List","AsyncFileUpload_UnknownServerError":"Unknown Server error","ResizableControlBehavior_InvalidHandler":"{0} handler not a function, function name, or function text","Animation_InvalidColor":"Color must be a 7-character hex representation (e.g. #246ACF), not \"{0}\"","RTE_CellColor":"Cell Color","PasswordStrength_RemainingMixedCase":"Mixed case characters","HTMLEditor_toolbar_button_HtmlMode_title":"HTML text","RTE_Italic":"Italic","CascadingDropDown_NoParentElement":"Failed to find parent element \"{0}\"","ValidatorCallout_DefaultErrorMessage":"This control is invalid","HTMLEditor_toolbar_button_DecreaseIndent_title":"Decrease Indent","RTE_Indent":"Indent","ReorderList_DropWatcherBehavior_CallbackError":"Reorder failed, see details below.\\r\\n\\r\\n{0}","PopupControl_NoDefaultProperty":"No default property supported for control \"{0}\" of type \"{1}\"","RTE_Normal":"Normal","PopupExtender_NoParentElement":"Couldn\u0027t find parent element \"{0}\"","RTE_ViewValues":"View Values","RTE_Legend":"Legend","RTE_Labels":"Labels","RTE_CellSpacing":"Cell Spacing","PasswordStrength_RemainingNumbers":"{0} more numbers","HTMLEditor_toolbar_popup_LinkProperties_field_Target":"Target","HTMLEditor_toolbar_button_PreviewMode_title":"Preview","RTE_Border":"Border","RTE_Create":"Create","RTE_BackgroundColor":"Background Color","RTE_Cancel":"Cancel","HTMLEditor_toolbar_button_PasteText_title":"Paste Plain Text","RTE_JustifyFull":"Justify Full","RTE_JustifyLeft":"Justify Left","RTE_Cut":"Cut","AsyncFileUpload_UploadingProblem":"The requested file uploading problem.","ResizableControlBehavior_CannotChangeProperty":"Changes to {0} not supported","RTE_ViewSource":"View Source","Common_InvalidPaddingUnit":"A unit type of \"{0}\" is invalid for parsePadding","RTE_Paste":"Paste","ExtenderBase_ControlNotRegisteredForCallbacks":"This Control has not been registered for callbacks","Calendar_Today":"Today: {0}","MultiHandleSlider_CssHeightWidthRequired":"You must specify a CSS width and height for all handle styles as well as the rail.","Common_DateTime_InvalidFormat":"Invalid format","HTMLEditor_toolbar_button_Copy_title":"Copy","ListSearch_DefaultPrompt":"Type to search","CollapsiblePanel_NoControlID":"Failed to find element \"{0}\"","RTE_ViewEditor":"View Editor","HTMLEditor_toolbar_popup_LinkProperties_field_Target_Current":"Current window","RTE_BarColor":"Bar Color","AsyncFileUpload_InternalErrorMessage":"The AsyncFileUpload control has encountered an error with the uploader in this page. Please refresh the page and try again.","HTMLEditor_toolbar_button_Underline_title":"Underline","PasswordStrength_DefaultStrengthDescriptions":"NonExistent;Very Weak;Weak;Poor;Almost OK;Barely Acceptable;Average;Good;Strong;Excellent;Unbreakable!","HTMLEditor_toolbar_button_SuperScript_title":"Super script","HTMLEditor_toolbar_button_Ltr_title":"Left to right direction","HTMLEditor_toolbar_button_RemoveAlignment_title":"Remove Alignment","HTMLEditor_toolbar_button_OrderedList_title":"Ordered List","HTMLEditor_toolbar_popup_LinkProperties_field_Target_New":"New window","HTMLEditor_toolbar_popup_LinkProperties_field_Target_Top":"Top window","HTMLEditor_toolbar_button_JustifyCenter_title":"Justify Center","RTE_Inserttexthere":"Insert text here","Animation_UknownAnimationName":"AjaxControlToolkit.Animation.createAnimation could not find an Animation corresponding to the name \"{0}\"","ExtenderBase_InvalidClientStateType":"saveClientState must return a value of type String","HTMLEditor_toolbar_button_JustifyLeft_title":"Justify Left","Rating_CallbackError":"An unhandled exception has occurred:\\r\\n{0}","HTMLEditor_toolbar_button_Undo_title":"Undo","HTMLEditor_toolbar_button_Redo_title":"Redo","Tabs_OwnerExpected":"owner must be set before initialize","DynamicPopulate_WebServiceTimeout":"Web service call timed out","PasswordStrength_RemainingLowerCase":"{0} more lower case characters","HTMLEditor_toolbar_button_BulletedList_title":"Bulleted List","HTMLEditor_toolbar_button_Paste_title":"Paste","Animation_MissingAnimationName":"AjaxControlToolkit.Animation.createAnimation requires an object with an AnimationName property","HTMLEditor_toolbar_button_PasteWord_title":"Paste from MS Word (with cleanup)","HTMLEditor_toolbar_button_Italic_title":"Italic","RTE_JustifyRight":"Justify Right","Tabs_ActiveTabArgumentOutOfRange":"Argument is not a member of the tabs collection","RTE_CellPadding":"Cell Padding","HTMLEditor_toolbar_button_ForeColorClear_title":"Clear foreground color","RTE_ClearFormatting":"Clear Formatting","AlwaysVisible_ElementRequired":"AjaxControlToolkit.AlwaysVisibleControlBehavior must have an element","HTMLEditor_toolbar_button_SubScript_title":"Sub script","Slider_NoSizeProvided":"Please set valid values for the height and width attributes in the slider\u0027s CSS classes","DynamicPopulate_WebServiceError":"Web Service call failed: {0}","PasswordStrength_StrengthPrompt":"Strength: ","HTMLEditor_toolbar_button_Rtl_title":"Right to left direction","PasswordStrength_RemainingCharacters":"{0} more characters","HTMLEditor_toolbar_button_BackColorClear_title":"Clear background color","PasswordStrength_Satisfied":"Nothing more required","RTE_Hyperlink":"Hyperlink","Animation_NoPropertyFound":"AjaxControlToolkit.Animation.createAnimation found no property corresponding to \"{0}\"","PasswordStrength_InvalidStrengthDescriptionStyles":"Text Strength description style classes must match the number of text descriptions.","HTMLEditor_toolbar_button_Use_verb":"Use {0}","HTMLEditor_toolbar_popup_LinkProperties_field_Target_Parent":"Parent window","PasswordStrength_GetHelpRequirements":"Get help on password requirements","HTMLEditor_toolbar_button_FixedBackColor_title":"Background color","PasswordStrength_InvalidStrengthDescriptions":"Invalid number of text strength descriptions specified","RTE_Underline":"Underline","HTMLEditor_toolbar_button_IncreaseIndent_title":"Increase Indent","AsyncFileUpload_ServerResponseError":"Server Response Error","Tabs_PropertySetAfterInitialization":"{0} cannot be changed after initialization","RTE_Rows":"Rows","RTE_Redo":"Redo","RTE_Size":"Size","RTE_Undo":"Undo","RTE_Bold":"Bold","RTE_Copy":"Copy","RTE_Font":"Font","HTMLEditor_toolbar_button_FontSize_label":"Size","HTMLEditor_toolbar_button_Cut_title":"Cut","CascadingDropDown_MethodError":"[Method error {0}]","HTMLEditor_toolbar_button_InsertLink_message_EmptyURL":"URL can not be empty","RTE_BorderColor":"Border Color","HTMLEditor_toolbar_button_RemoveStyles_title":"Remove styles","RTE_Paragraph":"Paragraph","RTE_InsertHorizontalRule":"Insert Horizontal Rule","HTMLEditor_toolbar_button_Paragraph_title":"Make Paragraph","Common_UnitHasNoDigits":"No digits","RTE_Outdent":"Outdent","Common_DateTime_InvalidTimeSpan":"\"{0}\" is not a valid TimeSpan format","Animation_CannotNestSequence":"AjaxControlToolkit.Animation.SequenceAnimation cannot be nested inside AjaxControlToolkit.Animation.ParallelAnimation","HTMLEditor_toolbar_button_InsertHR_title":"Insert horizontal rule","HTMLEditor_toolbar_button_OnPasteFromMSWord":"Pasting from MS Word is switched on. Just now: {0}","Shared_BrowserSecurityPreventsPaste":"Your browser security settings don\u0027t permit the automatic execution of paste operations. Please use the keyboard shortcut Ctrl+V instead."};
if(typeof(Sys)!=='undefined')Sys.Application.notifyScriptLoaded();