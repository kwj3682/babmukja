<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  	<link rel="stylesheet" href="<c:url value="/resources/css/member/mypage.css"/>">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
    <div id="open-filter">
        <p>"${user.memNickname}'s KITCHEN"</p>
    </div>
    <div id="container">
    </div>

    <script src="<c:url value="/resources/js/three/three.min.js"/>"></script>
    <script src="<c:url value="/resources/js/three/PointLight.js"/>"></script>
    <script src="<c:url value="/resources/js/three/GLTFLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/DRACOLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/three.interaction/build/three.interaction.js"/>"></script>


    <script>
		
		var camera, scene, renderer;
			
		
			var isUserInteracting = false,
				onMouseDownMouseX = 0, onMouseDownMouseY = 0,
				lon = 0, onMouseDownLon = 0,
				lat = 0, onMouseDownLat = 0,
				phi = 0, theta = 0;
			init();
			animate();
			function init() {
                
                $("#open-filter").click(function(){
                        $(this).hide();
                    }
                );
				var container, mesh;
				container = document.getElementById( 'container' );
				camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1,600 );
				camera.target = new THREE.Vector3( 0, 0, 0 );
				scene = new THREE.Scene();
				var geometry = new THREE.SphereBufferGeometry( 600, 60, 40 );
				// invert the geometry on the x-axis so that all of the faces point inward
				geometry.scale( - 1, 1, 1 );
				var texture = new THREE.TextureLoader().load( '<c:url value="/resources/images/kitchenenvironment.jpg"/>' );
				var material = new THREE.MeshBasicMaterial( { map: texture } );
				mesh = new THREE.Mesh( geometry, material );
				scene.add( mesh );
				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );
				document.addEventListener( 'mousedown', onPointerStart, false );
				document.addEventListener( 'mousemove', onPointerMove, false );
				document.addEventListener( 'mouseup', onPointerUp, false );
				document.addEventListener( 'wheel', onDocumentMouseWheel, false );
				document.addEventListener( 'touchstart', onPointerStart, false );
				document.addEventListener( 'touchmove', onPointerMove, false );
				document.addEventListener( 'touchend', onPointerUp, false );
				//
				document.addEventListener( 'dragover', function ( event ) {
					event.preventDefault();
					event.dataTransfer.dropEffect = 'copy';
				}, false );
				document.addEventListener( 'dragenter', function () {
					document.body.style.opacity = 0.5;
				}, false );
				document.addEventListener( 'dragleave', function () {
					document.body.style.opacity = 1;
				}, false );
				document.addEventListener( 'drop', function ( event ) {
					event.preventDefault();
					var reader = new FileReader();
					reader.addEventListener( 'load', function ( event ) {
						material.map.image.src = event.target.result;
						material.map.needsUpdate = true;
					}, false );
					reader.readAsDataURL( event.dataTransfer.files[ 0 ] );
					document.body.style.opacity = 1;
				}, false );
				//
				window.addEventListener( 'resize', onWindowResize, false );
			}
			function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
			}
			function onPointerStart( event ) {
				isUserInteracting = true;
				var clientX = event.clientX || event.touches[ 0 ].clientX;
				var clientY = event.clientY || event.touches[ 0 ].clientY;
				onMouseDownMouseX = clientX;
				onMouseDownMouseY = clientY;
				onMouseDownLon = lon;
				onMouseDownLat = lat;
			}
			function onPointerMove( event ) {
				if ( isUserInteracting === true ) {
					var clientX = event.clientX || event.touches[ 0 ].clientX + 1000;
					var clientY = event.clientY || event.touches[ 0 ].clientY + 1000;
					lon = ( onMouseDownMouseX - clientX ) * 0.1 + onMouseDownLon;
					lat = ( clientY - onMouseDownMouseY ) * 0.1 + onMouseDownLat;
				}
			}
			function onPointerUp() {
				isUserInteracting = false;
			}
			function onDocumentMouseWheel( event ) {
				var fov = camera.fov + event.deltaY * 0.1;
				camera.fov = THREE.Math.clamp( fov, 10, 75 );
				camera.updateProjectionMatrix();
			}
			function animate() {
				requestAnimationFrame( animate );
				update();
			}
			function update() {
				if ( isUserInteracting === false ) {
					lon += 0.0;
				}
				lat = Math.max( - 85, Math.min( 85, lat ) );
				phi = THREE.Math.degToRad( 90 - lat );
				theta = THREE.Math.degToRad( lon );
				camera.target.x = 500 * Math.sin( phi ) * Math.cos( theta );
				camera.target.y = 500 * Math.cos( phi );
				camera.target.z = 500 * Math.sin( phi ) * Math.sin( theta );
				camera.lookAt( camera.target );
				/*
				// distortion
				// camera.position.copy( camera.target ).negate();
				*/
				renderer.render( scene, camera );
            }
            //-------------------------- box loading part ----------------------------------//
			var bookGeometry1 = new THREE.BoxBufferGeometry( 4, 5, 0.3 );
			var bookMaterials1 = [
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),//RIGHT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// LEFT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// TOP SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// BOTTOM SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook1.jpg"/>'),side: THREE.FrontSide} ),//FRONT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook1.jpg"/>'),side: THREE.FrontSide} ),//BACK SIDE
			];
			var book1 = new THREE.Mesh( bookGeometry1, bookMaterials1 );
			book1.position.x = -21;
			book1.position.y = -15;
			book1.position.z = 20;
			
			var bookGeometry2 = new THREE.BoxBufferGeometry( 4, 5, 0.3 );
			var bookMaterials2 = [
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),//RIGHT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// LEFT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// TOP SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// BOTTOM SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook2.jpg"/>'),side: THREE.FrontSide} ),//FRONT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook2.jpg"/>'),side: THREE.FrontSide} ),//BACK SIDE
			];
			var book2 = new THREE.Mesh( bookGeometry2, bookMaterials2 );
			book2.position.x = -21;
			book2.position.y = -15;
			book2.position.z = 21;
			
			var bookGeometry3 = new THREE.BoxBufferGeometry( 4, 5, 0.3 );
			var bookMaterials3 = [
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),//RIGHT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// LEFT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// TOP SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook-front.jpg"/>'),side: THREE.FrontSide} ),// BOTTOM SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook3.jpg"/>'),side: THREE.FrontSide} ),//FRONT SIDE
				new THREE.MeshBasicMaterial( {map: new THREE.TextureLoader().load('<c:url value="/resources/images/recipebook3.jpg"/>'),side: THREE.FrontSide} ),//BACK SIDE
			];
			var book3 = new THREE.Mesh( bookGeometry3, bookMaterials3 );
			book3.position.x = -21;
			book3.position.y = -15;
			book3.position.z = 22;
			
			scene.add( book1 );
			scene.add( book2 );
			scene.add( book3 );
			//-------------------------- Geometry loading part------------------------------//
			
			var loader = new THREE.GLTFLoader();
			THREE.DRACOLoader.setDecoderPath( '/js/draco' );
			loader.setDRACOLoader( new THREE.DRACOLoader() );
			// Load a glTF resource
			loader.load(
				// resource URL
				'<c:url value="/resources/images/frypan.gltf"/>',
				// called when the resource is loaded
				function ( gltf ) {
					let hundredSize = 100;
					scene.add( gltf.scene );
					gltf.scene.position.x = 10;
					gltf.scene.position.y = -12;
					gltf.scene.position.z = 5;
					gltf.scene.scale.x = hundredSize;
					gltf.scene.scale.y = hundredSize;
					gltf.scene.scale.z = hundredSize;
									
					gltf.scene.rotation.x = 0;
					gltf.scene.rotation.y = 1;
					gltf.scene.rotation.z = 0;

					gltf.animations; // Array<THREE.AnimationClip>
					gltf.scene; // THREE.Scene
					gltf.scenes; // Array<THREE.Scene>
					gltf.cameras; // Array<THREE.Camera>
					gltf.asset; // Object
					
					gltf.scene.on('mouseover',function(ev){
						// alert("오 개신기"+ev);
						gltf.scene.scale.x = hundredSize*2.5;
						gltf.scene.scale.y = hundredSize*2.5;
						gltf.scene.scale.z = hundredSize*2.5;
					}).on('pointerout',function(){
						gltf.scene.scale.x = hundredSize;
						gltf.scene.scale.y = hundredSize;
						gltf.scene.scale.z = hundredSize;

					}).on('click',function(){
						location.href="/babmukja/recipe/writeform.do";
					});
				},
				// called while loading is progressing
				function ( xhr ) {

					console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

				},
				// called when loading has errors
				function ( error ) {

					console.log( 'An error happened' );

				}
			);
			var loader2 = new THREE.GLTFLoader();
			THREE.DRACOLoader.setDecoderPath( '/js/draco' );
			loader2.setDRACOLoader( new THREE.DRACOLoader() );
			// Load a glTF resource
			loader2.load(
				// resource URL
				'<c:url value="/resources/images/basket.gltf"/>',
				// called when the resource is loaded
				function ( gltf ) {
					let boxSize = 80;
					scene.add( gltf.scene );
					console.dir(gltf.scene.position);
					gltf.scene.position.x = -10;
					gltf.scene.position.y = -60;
					gltf.scene.position.z = 20;
					gltf.scene.scale.x = boxSize;
					gltf.scene.scale.y =boxSize;
					gltf.scene.scale.z = boxSize;
					console.dir(gltf.scene.scale);
									
					gltf.scene.rotation.x = 0;
					gltf.scene.rotation.y = 1;
					gltf.scene.rotation.z = 0;

					gltf.animations; // Array<THREE.AnimationClip>
					gltf.scene; // THREE.Scene
					gltf.scenes; // Array<THREE.Scene>
					gltf.cameras; // Array<THREE.Camera>
					gltf.asset; // Object
					
					gltf.scene.on('mouseover',function(ev){
						// alert("오 개신기"+ev);
						gltf.scene.scale.x = boxSize*2.5;
						gltf.scene.scale.y = boxSize*2.5;
						gltf.scene.scale.z = boxSize*2.5;
					}).on('pointerout',function(){
						gltf.scene.scale.x = boxSize;
						gltf.scene.scale.y = boxSize;
						gltf.scene.scale.z = boxSize;

					}).on('click',function(){
						location.href="/babmukja/store/mainpb.do";
					});
				},
				// called while loading is progressing
				function ( xhr ) {

					console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

				},
				// called when loading has errors
				function ( error ) {

					console.log( 'An error happened' );

				}
			);
		//------------------------lighting ------------------------------------//
			// var light = new THREE.AmbientLight( 0x909080 ); // soft white light
			var pointLight = new THREE.PointLight( 0xffff95, 6, 150 );
			pointLight.position.set( 50, 50, 50 );
			scene.add( pointLight );

		//------------------------interaction---------------------------------//
			var interaction = new THREE.Interaction(renderer, scene, camera);
		</script>
</body>
</html>