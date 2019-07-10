$(document).ready(function(){
    

        // 1. Handling the various events
        // - get references to different elements we need
        // - listen to drag, drop and change events
        // - handle dropped and selected files

        // get a reference to the file drop area and the file input
        var fileDropArea = document.querySelector('.file-drop-area');
        var fileInput = fileDropArea.querySelector('input');
        var fileInputName = fileInput.name;



        // listen to events for dragging and dropping
        fileDropArea.addEventListener('dragover', handleDragOver);
        fileDropArea.addEventListener('drop', handleDrop);
        fileInput.addEventListener('change', handleFileSelect);

        // need to block dragover to allow drop
        function handleDragOver(e) {
            e.preventDefault();
        }

        // deal with dropped items,
        function handleDrop(e) {
            e.preventDefault();
            handleFileItems(e.dataTransfer.items || e.dataTransfer.files);
        }

        // handle manual selection of files using the file input
        function handleFileSelect(e) {
            handleFileItems(e.target.files);
        }

        // 2. Handle the dropped items
        // - test if the item is a File or a DataTransferItem
        // - do some expectation matching

        // loops over a list of items and passes
        // them to the next function for handling
        function handleFileItems(items) {
            var l = items.length;
            for (var i=0; i<l; i++) {
                handleItem(items[i]);
            }
        }

        // handles the dropped item, could be a DataTransferItem
        // so we turn all items into files for easier handling
        function handleItem(item) {

            // get file from item
            var file = item;
            if (item.getAsFile && item.kind =='file') {
                file = item.getAsFile();
            }

            handleFile(file);
        }

        // now we're sure each item is a file
        // the function below can test if the files match
        // our expectations
        function handleFile(file) {

            /*
             // you can check if the file fits all requirements here
             // for example:
             // if file is bigger then 1 MB don't load
             if (file.size > 1000000) {
             return;
             }
             */

            // if it does, create a cropper
            createCropper(file);
        }

        // 3. Create the Image Cropper
        // - create an element for the cropper to bind to
        // - add the element after the drop area
        // - creat the cropper and bind the remove button so it
        //   removes the entire cropper when clicked.

        // create an Image Cropper for each passed file
        function createCropper(file) {

            // create container element for cropper
            var cropperContainerDiv = document.createElement('div');
            cropperContainerDiv.className = 'one-image';

            // insert this element inside slim-containers div
            document.getElementById('slim-containers').appendChild(cropperContainerDiv);

            //create progress
            var progress = document.createElement('div');
            progress.className = 'progress';
            progress.setAttribute('style','height:10px');

            //create progress bar
            var progressBar = document.createElement('div');
            progressBar.className = 'progress-bar';
            progressBar.setAttribute('role','progressbar');
            progressBar.setAttribute('aria-valuenow','0');
            progressBar.setAttribute('aria-valuemin','0');
            progressBar.setAttribute('aria-valuemax','100');
            progressBar.setAttribute('style','width: 0%;');

            progress.appendChild(progressBar);
            cropperContainerDiv.appendChild(progress);

            //create div for slim cropper
            var cropperDiv = document.createElement('div');
            cropperContainerDiv.appendChild(cropperDiv);

            var cropper = new Slim(cropperDiv,{
                ratio: 'free',
                jpgCompression: 50,
                size: '1500,1500',
                edit: false,
                defaultInputName: fileInputName,
                statusUploadSuccess: true,
                didRemove: function() {
                    // detach from DOM
                    cropperContainerDiv.parentNode.removeChild(cropperContainerDiv);
                    // destroy the slim cropper
                    cropper.destroy();
                }
            });
            
            
            cropper.load(file, function(error, data){

                if (error != null){
                    //show trash button for user to remove;
                    var btnGroup = cropperDiv.querySelector('.slim-btn-group');
                    btnGroup.setAttribute('style','display:block!important;');
                    console.log(error);
                }else{

                    // var new_name = data.input.name.split('.')[0] + '_' +  new Date().getTime() + '.' + data.input.name.split('.')[1];
                    // var photo_bucket_prefix = $('.job-bag-images').data('photo-bucket-prefix');
                    // var job_bag_id = $('.job-bag-images').data('job-bag-id');
                    // $.ajax(fetchPresignImageUrl(photo_bucket_prefix, new_name, data.input.type, job_bag_id)).done(function(result){
                    //     var presigned_url = result.presigned_url;
                    //
                    //     var imgBlob = dataURItoBlob(JSON.parse(cropperDiv.childNodes[1].value).output.image);
                    //
                    //     $.ajax({
                    //         xhr: function() {
                    //             var xhr = new window.XMLHttpRequest();
                    //             //Upload progress
                    //             xhr.upload.addEventListener("progress", function(evt){
                    //                 if (evt.lengthComputable) {
                    //                     var percentComplete = parseInt((evt.loaded / evt.total) * 100 );
                    //                     //Do something with upload progress
                    //                     progressBar.setAttribute('aria-valuenow', "'" + percentComplete + "'" );
                    //                     progressBar.setAttribute('style','width: ' + percentComplete + '%;');
                    //                 }
                    //             }, false);
                    //             return xhr;
                    //         },
                    //         type: 'PUT',
                    //         url: presigned_url,
                    //         // Content type must much with the parameter you signed your URL with
                    //         contentType: data.input.type,
                    //         // this flag is important, if not set, it will try to send data as a form
                    //         processData: false,
                    //         // the actual file is sent raw
                    //         data: imgBlob
                    //     })
                    //         .success(function() {
                    //             console.log('File uploaded');
                    //             cropperContainerDiv.parentNode.removeChild(cropperContainerDiv);
                    //             // destroy the slim cropper
                    //             cropper.destroy();
                    //
                    //             $.ajax({
                    //                 url: "/admin/" + job_bag_id + "/add_image_tile",
                    //                 dataType: 'script',
                    //                 data: {url: 'https://trophy-flow-production.s3.amazonaws.com/' + photo_bucket_prefix + '/' + new_name }
                    //             });
                    //
                    //         })
                    //         .error(function() {
                    //             console.log('File NOT uploaded');
                    //             console.log( arguments);
                    //         });
                    //
                    // });
                }

            });


        }

        // 4. Disable the file input element

        // hide file input, we can now upload with JavaScript
        fileInput.style.display = 'none';

        // remove file input name so it's value is
        // not posted to the server
        fileInput.removeAttribute('name');



        /// generate random srreing for filename for
        function randomString(length){
            var text = "";
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            for (var i = 0; i < length; i++) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
            }
            return text;
        }

        function fetchPresignImageUrl(photo_bucket_prefix, name, file_type, job_bag_id) {
            return {
                url: "/admin/" + job_bag_id + "/get_presigned_url",
                dataType: "json",
                data: {
                    prefix: photo_bucket_prefix,
                    name: name,
                    file_type: file_type
                }
            }
        }

        function dataURItoBlob(dataURI) {
            // convert base64 to raw binary data held in a string
            // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
            var byteString = atob(dataURI.split(',')[1]);

            // separate out the mime component
            var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]

            // write the bytes of the string to an ArrayBuffer
            var ab = new ArrayBuffer(byteString.length);
            var ia = new Uint8Array(ab);
            for (var i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }

            // write the ArrayBuffer to a blob, and you're done
            var bb = new Blob([ab],{
                type: mimeString
            });
            return bb;
        }

        function uploadProgressIndicator(progress_bar) {

            var xhr = new window.XMLHttpRequest();
            //Upload progress
            xhr.upload.addEventListener("progress", function(evt){
                if (evt.lengthComputable) {
                    var percentComplete = parseInt((evt.loaded / evt.total) * 100 );
                    //Do something with upload progress
                    progress_bar.setAttribute('aria-valuenow', "'" + percentComplete + "'" );
                    progress_bar.setAttribute('style','width: ' + percentComplete + '%;');
                    console.log(percentComplete);
                }
            }, false);
            // //Download progress
            // xhr.addEventListener("progress", function(evt){
            //     if (evt.lengthComputable) {
            //         var percentComplete = evt.loaded / evt.total;
            //         //Do something with download progress
            //         console.log(percentComplete);
            //     }
            // }, false);
            return xhr;
        }
    


});

