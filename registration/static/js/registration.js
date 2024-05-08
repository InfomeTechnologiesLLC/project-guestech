
  
var notyf = new Notyf({position:{x:'center',y:'top'},duration: 3000,});

const SubmitEvent = (event) =>{
  event.preventDefault()
  
  if (ExtravalidationPass() == false){
    return false
  }
  
  $(event.target).find(':submit').attr('disabled',true)
  $(event.target).find(':submit').html('<div class="spinner-border spinner-border-sm mx-4  form-spinner " role="status"></div>')


  let _formData=new FormData($(event.target)[0])
  _formData.append('csrfmiddlewaretoken',csrf_token)

  $.ajax({
    type: "POST",
    url: "/event-registration-submission",
    data: _formData,
    contentType:false,
    processData:false,
    dataType: "json",
    success: function (response) {
      console.log(response);
      if (response.success){
        sendSubmissionMail('event',response.id)

        setTimeout(() => {
          window.location.replace("/registration-success?reg-form=event")
          // $(event.target)[0].reset()
          $(event.target).find(':submit').html('submit')

          $(event.target).find(':submit').attr('disabled',false)

          // window.history.
        
        }, 2000);

      }else{
        notyf.error(response.reason)

        $(event.target).find(':submit').html('submit')

        $(event.target).find(':submit').attr('disabled',false)
      }

    }
  });

}


const SubmitBuild = (event) =>{
  event.preventDefault()
  
  if (ExtravalidationPass() == false){
    return false
  }
  
  $(event.target).find(':submit').attr('disabled',true)
  $(event.target).find(':submit').html('<div class="spinner-border spinner-border-sm mx-4  form-spinner " role="status"></div>')


  let _formData=new FormData($(event.target)[0])
  _formData.append('csrfmiddlewaretoken',csrf_token)

  $.ajax({
    type: "POST",
    url: "/build-registration-submission",
    data: _formData,
    contentType:false,
    processData:false,
    dataType: "json",
    success: function (response) {
      console.log(response);
      if (response.success){
        sendSubmissionMail('build',response.id)

        setTimeout(() => {
          window.location.replace("/registration-success?reg-form=build")
          // $(event.target)[0].reset()
          $(event.target).find(':submit').html('submit')

          $(event.target).find(':submit').attr('disabled',false)

          // window.history.
        
        }, 2000);

      }else{
        $(event.target).find(':submit').html('submit')

        $(event.target).find(':submit').attr('disabled',false)
        notyf.error(response.reason)
      }

    }
  });

}


const SubmitVapp = (event) =>{
  event.preventDefault()
  
  if (ExtravalidationPass() == false){
    return false
  }
  
  $(event.target).find(':submit').attr('disabled',true)
  $(event.target).find(':submit').html('<div class="spinner-border spinner-border-sm mx-4  form-spinner " role="status"></div>')


  let _formData=new FormData($(event.target)[0])
  _formData.append('csrfmiddlewaretoken',csrf_token)

  $.ajax({
    type: "POST",
    url: "/vapp-registration-submission",
    data: _formData,
    contentType:false,
    processData:false,
    dataType: "json",
    success: function (response) {
      console.log(response);
      if (response.success){
        sendSubmissionMail('vapp',response.id)

        setTimeout(() => {
          window.location.replace("/registration-success?reg-form=vapp")
          // $(event.target)[0].reset()
          $(event.target).find(':submit').html('submit')

          $(event.target).find(':submit').attr('disabled',false)

          // window.history.
        
        }, 2000);

      }else{
        $(event.target).find(':submit').html('submit')

        $(event.target).find(':submit').attr('disabled',false)
        notyf.error(response.reason)
      }

    }
  });

}

const sendSubmissionMail = (table,id)=>{

  let _data={'table-name':table,'id':id,'csrfmiddlewaretoken':csrf_token}
  $.ajax({
    type: "POST",
    url: "/email-success-ajax",
    data: _data,
    dataType: "json",
    success: function (response) {
      
    }
  });
}

// other functions

$('.id-proof-select').change(function() {
    console.log($(this).val())
  if ($(this).val() == 'Emirates-Id'){
    $('.id-proof-number-lable').text("EMIRATES ID NUMBER")
    $('.id-proof-file-front-lable').text("UPLOAD EMIRATES ID FRONT")
    $('.id-proof-file-back-lable').text("UPLOAD EMIRATES ID BACK")
    $('.id-proof-expire-date-lable').text("EMIRATES ID EXPIRY DATE")
    $(".id-proof-file-back-div").removeClass('d-none')
    $('.emirates-id-back').attr('required',true)
  }
  if ($(this).val() == 'Passport-Id'){
    $('.id-proof-number-lable').text("PASSPORT NUMBER")
    $('.id-proof-file-front-lable').text("UPLOAD PASSPORT FRONT")
    
    $(".id-proof-file-back-div").addClass('d-none')
    $('.id-proof-file-back-lable').text("UPLOAD PASSPORT BACK")
    $('.id-proof-expire-date-lable').text("PASSPORT EXPIRY DATE")
    $('.emirates-id-back').attr('required',false)

  }

})

$('.id-proof-number-format').keyup(function (e) { 

  
  if ($('.id-proof-select').val() == 'Emirates-Id'){

    if (e.target.value.length >= 18){
      e.target.value=e.target.value.substr(0,18)
    }
        
    var text=e.target.value.replaceAll('-','').split('')

    
          for (let i = 0; i < text.length; i++) {
    
            if (i== 3 ){
                text.splice(3,0,'-')

              
              }

              if (i == 8 ){
                  text.splice(8,0,'-')

                  
              }

              if (i == 16 ){
                    text.splice(16,0,'-')
              }

              // if (i == 1 ){
              //       text.splice(16,0,'-')
              // }
          

          }

          e.target.value=text.join('')
         
   
  }

});

// $('.extra-validation').change(function () {
//   console.log(ExtravalidationPass())

// })

function ExtravalidationPass() {
    
   
  //location validation
  
  var fail_count=0
    
  // $('.locations:checked').each(function() {
  //   console.log($(this).val())
  // })


  var expiryDate = new Date($('.expiry-check').val());
  var currentDate = new Date();

  if ( expiryDate <=currentDate ){
    $('.expiry-check').addClass('is-invalid')
    $('.id-expiry-date-is-not-valid').removeClass('d-none')
    notyf.error('Id Expired');
    fail_count ++
  } 
  else{
    $('.expiry-check').removeClass('is-invalid')
    $('.id-expiry-date-is-not-valid').addClass('d-none')
    
  }

  return fail_count >= 1 ? false : true
  
  
}

$('.validate-file').change(function(e){
  
  var file = e.target.files[0];

  if (file.size > 3145728 ){

  

    notyf.error('Maximum file size is 3mb');
    $(e.target).val(null)
    return false

  }

})


$('.form-reset-btn').click(function(){

  $(this).closest('form')[0].reset()


})


function toggleAdditionalRow() {
  const needEventPassYes = document.getElementById("eventPassYes");
  
  
  if (needEventPassYes.checked) {
    
    $('.additional-row').removeClass('d-none')
    $('.set-additional-required').attr('required',true)
 
  } else {
    $('.additional-row').addClass('d-none')
    $('.set-additional-required').attr('required',false)
    
  }
}

// Image Cropper 


var cropper; // Variable to store the Cropper.js instance

function openImageCropPopup(input) {
  var file = input.files[0];

  if (file.size > 3145728 ){

    
    var notyf = new Notyf({position:{x:'center',y:'top'},duration: 3000,});

    notyf.error('Maximum file size is 3mb');
    $(input).val(null)
    return false

  }
  

  var reader = new FileReader();

  reader.onload = function(e) {
    // Update the image source with the uploaded file
    document.getElementById('uploaded-image').src = e.target.result;

    // Destroy the previous Cropper.js instance, if exists
    if (cropper) {
      cropper.destroy();
    }

    // Show the image cropping popup
    $('#imageCropModal').modal('show');

    // Initialize Cropper.js inside the modal
    cropper = new Cropper(document.getElementById('uploaded-image'), {
      aspectRatio: 1, // Set the aspect ratio for cropping (e.g., 1:1 for a square)
      viewMode: 2, // Set the view mode to restrict the cropping area within the container
      zoomable: false, // Disable zooming the image
      guides: true, // Show guides for the cropping area
      minContainerWidth: 300, // Set the minimum width of the cropping container
      minContainerHeight: 300, // Set the minimum height of the cropping container
    });

 


  };
  reader.readAsDataURL(file);
}



function cropImage() {
  if (cropper) {
    // Get the cropped image data
    var croppedDataUrl = cropper.getCroppedCanvas().toDataURL();

    var m_input =document.getElementById('photo-badge-upload')

    // var image = base64toBlob(croppedDataUrl)

    // console.log(image)
      let list = new DataTransfer();
      const file = dataURLtoFile(croppedDataUrl,m_input.files[0].name)
      list.items.add(file);
      m_input.files=list.files
          // Perform any actions with the cropped image data (e.g., upload, save, etc.)
    //console.log(croppedDataUrl);

  

  // Hide the image cropping popup
  $('#imageCropModal').modal('hide');
}
}

function cancelCrop() {
  // Reset the file input to clear the selected file
  var fileInput = document.getElementById('photo-badge-upload');
  fileInput.value = '';

  // Clone and replace the file input element with a new instance
  // var newFileInput = fileInput.cloneNode(true);
  // fileInput.parentNode.replaceChild(newFileInput, fileInput);

  // Hide the image cropping popup
  $('#imageCropModal').modal('hide');
}

$('#imageCropModal').on('hidden.bs.modal', function() {
  if (cropper) {
    // Destroy the Cropper.js instance when closing the modal
    cropper.destroy();
    cropper = null;
  }
  });


function dataURLtoFile(dataurl, filename) {
  var arr = dataurl.split(","),
    mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(arr[1]),
    n = bstr.length,
    u8arr = new Uint8Array(n);
  while (n--) {
    u8arr[n] = bstr.charCodeAt(n);
  }
  return new File([u8arr], filename, { type: mime });
}

