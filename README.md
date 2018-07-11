# Facilitate creating [Reveal.js](http://lab.hakim.se/reveal-js/#/) presentations with RMarkdown

This package takes the [`revealjs`](https://github.com/rstudio/revealjs) R package, which can be used [for creating slideshows](https://bookdown.org/yihui/rmarkdown/revealjs.html) with [RMarkdown](https://rmarkdown.rstudio.com/lesson-15.html), and adds extra functionality.

## Installation

### Install R and RStudio

- Download and install [R](https://cran.cnr.berkeley.edu/) (choose the link at the top of the linked page for your operating system).
    - If you click Windows, click "base" on the following page.
    - If you click Mac OS X, click the first link under "Latest Release" (it will look like "R-3.5.0.pkg")
    - If you click Linux, you probably already have R installed on your system. If not, go through your Operating System’s package manager.
- Download and install [RStudio](https://www.rstudio.com/products/rstudio/download/#download) (choose the link at the top of the linked page for your operating system).
- Open RStudio
    - If you are on a Mac, you may be asked to install "Developer Tools." Go ahead and click Ok. RStudio may later say that it is "Finding software," or something similar. This may take a while, but will eventually finish.
    - Once RStudio is open, click on the bottom left part of the screen, next to the ">" symbol. Paste the following, and then press Enter on your keyboard:

### Install the software

```r
install.packages('devtools')
```

It will probably take several minutes to install everything. You’ll know it’s finished once you see the ">" symbol at the bottom of the screen again.

You can then install this package, by similarly pasting the code below and pressing Enter on your keyboard:

```r
devtools::install_github("publicus/r-revealjs.additions")
```

Additionally, I recommend installing the `remedy` package by Colin Fay to facilitate writing in Markdown:

```r
devtools::install_github("ThinkR-open/remedy")
```

## Use

### Open an RMarkdown template for a `reveal.js` presentation

An RMarkdown template illustrating several of the `reveal.js` features can be viewed and used from within RStudio by clicking `File -> New File -> R Markdown... -> From Template -> Reveal.js Additions Slideshow.`

### Use additional buttons in the RStudio interface

When editing your RMarkdown presentation, you can click `Addins` at the top of the RStudio window. Under `Remedy`, you will find buttons to facilitate writing with Markdown (see also the [RMarkdown cheat sheet](https://rmarkdown.rstudio.com/lesson-15.html) from RStudio).

Under `Reveal.js Additions`, you will find buttons to facilitate writing markdown specifically for `reveal.js`:

To create a "fragment" (a part of a slide that is initially hidden and then is revealed after advancing the slide), highlight what you would like to initially hide, and click the "Fragment" button.

```html
<span class="fragment"></span>
```

You can highlight a fragment (you must hightlight the entire opening `<span...>` tag), and click the "Fragment index" button to add the order in which the fragment should appear among other fragments on the slide...

```html
<span data-fragment-index="1" class="fragment"></span>
```

... and/or click the "Fragment highlight" button to make the fragment change color instead of reveal itself. Allowed colors are `red`, `blue`, and `green`.

```html
<span class="highlight-red fragment"></span>
```

You can highlight markdown (ideally, not including headings) and click the "Speaker notes" button to add speaker notes for a slide.

```html
<aside class="notes">
Speaker notes go here.
</aside>
```

You can place your cursor on a heading line, and then click the "Slide background" button to add a custom background, either a color (such as "teal" below), or an image (as is show in the RMarkdown template).

```r
## Slide title {data-background="teal"}
```

You can also place your cursor on a heading line, and then click the "Slide transition" button to give the slide a custom transition.

```r
## Slide title {data-transition="zoom"}
```

Finally, you can highlight the text of a slide title, and click on the "White background" button to give the text a white background (for example, for use on slides with dark backgrounds or image backgrounds).

```r
## <span class="box-background">Slide title</span> {data-background="teal"}
```

### Render the presentation

To see your presentation, click `Knit` at the top of the RStudio window. An HTML file and `your_presentation_name_files` folder will be generated alongside the presentation document on your computer. You can open that HTML file in any web browser (preferably [Google Chrome](https://www.google.com/chrome/)).

When the presentation has finished rendering, RStudio will open a window displaying it. Some advanced features, such as custom slide backgrounds, may not render in this pop-up window. Within that window, you can click "Open in Browser" to see the presentation in the browser. You can also open the file directly in the web browser, by double-clicking on it in your computer's file browser, or by selecting `File --> Open...` in your web browser.

### Give the presentation

To move the rendered presentation to another computer, copy the HTML and `your_presentation_name_files` folder that were created when you clicked `Knit` in RStudio above.

