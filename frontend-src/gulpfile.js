//https://www.toptal.com/javascript/optimize-js-and-css-with-gulp

const gulp          = require('gulp');
const browserSync   = require('browser-sync').create();
const concat        = require('gulp-concat');
const minify 		= require('gulp-minify');
const sass          = require('gulp-sass')(require('sass'));
const cleanCss 		= require('gulp-clean-css');
const sourceMaps    = require('gulp-sourcemaps');

//Compile JS
gulp.task(
	'pack-js',
	function (){    
		return gulp.src([
				'node_modules/jquery/dist/jquery.js',
                //'node_modules/bootstrap/dist/js/bootstrap.bundle.js',
				//'node_modules/bootstrap/dist/js/bootstrap.bundle.min.js',
				'src/js/*.js'
			])
			.pipe(concat('main.js'))
            //.pipe(uglify())
			.pipe(minify({
				ext:{
					min:'.js'
				},
				noSource: true
			}))
                
			.pipe(gulp.dest('media/js'));
	}
);

//Compile SASS (.scss files)
gulp.task(
	"sass",
	gulp.series(function() {
		return gulp
			.src(["src/scss/main.scss"])
			.pipe(sourceMaps.init())
			.pipe(
				sass({
					outputStyle: 'compressed'
				}).on('error', sass.logError)
			)
			//.pipe(cleanCss()) //Use for only CSS files. This pipe with Sass outputStyle: 'compressed' is useless
			.pipe(sourceMaps.write(""))
			.pipe(gulp.dest("media/style"))
			.pipe(browserSync.stream());
	}),
);

//Watch .html and .scss
gulp.task(
	"server",
	gulp.series(["sass","pack-js"],
	function() {
		browserSync.init({
			server: "",
		});

		gulp.watch(["src/scss/*.scss"], gulp.parallel(["sass"]));
		gulp.watch(["src/js/*.js"], gulp.parallel(["pack-js"]));

		gulp
			.watch(["*.html", "src/scss/*.scss", "src/css/*.css", "src/js/*.js"])
			.on("change", gulp.parallel(browserSync.reload));
	}),
);

gulp.task(
	"default",
	gulp.series(["server"]));