```python

{% highlight python %}
{% endhighlight %}

highlighter: rouge 

```

## supported text style

```python
basic = {indent, sidenote, sidenote-pretty,textbox, textbox-pretty, p, picture, picture img, ul, li, caption, blockquote-pretty}
simple = {monospace, underline, hidden, underline-move, underline-blue, underline-pink, underline-grad} 
highlight = {three, highlight, highlight-gradient, highlight-skew, highlight-sketch, highlight-pink, highlight-green, highlight-yellow, circle-sketch-highlight, arrow-highlight}
text = {rainbow, red, blue, black, gradient, shadow, stroke, shadow-blue, shadow-white, neon}
math = {theorem, lemma, proof, defintion}
dynamic = {typewriter, zoom, flow, glow, gif, showup, reveal, shine, blink, frozen, neon-green, neon-pink}
mark = {teal, gold, blue, coral}

img = {half-gallery, half-img1, half-img2, half-img3, triple-gallery, triple-img1, triple-img2, triple-img3, img-small-center}

```

- picture img width 700px
- article font-size 20px
- article font-family Lora
- article h1 to h6 font-weight 600
- inline style
```
<h1 style="color: red; font-size: 32px;">
```
- types of action
```
action = {hover, active, focus, playing, paused}
```
- table
```
Result Skip Results Iframe
EDIT ON
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>ID</th>
      <th>Favorite Color</th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <th>Name</th>
      <th>ID</th>
      <th>Favorite Color</th>
    </tr>
  </tfoot>
  <tbody>
    <tr>
      <td>Jim</td>
      <td>00001</td>
      <td>Blue</td>
    </tr>
   </tbody>
</table>
```
- embed class
```
embed = {embed-responsive, embed-responsive-item, iframe, embed, object, video, embed-responsive-21by9, embed-responsive-16by9, embed-responsive-4by3, embed-responsive-1y1}
```
```
<iframe src="http://docs.google.com/gview?url=http://example.com/mypdf.pdf&embedded=true" style="width:700px; height:700px;" frameborder="0"></iframe>

<embed src="{{site.baseurl}}/doc/something.pdf" type="application/pdf"></embed>

<object data="{{site.baseurl}}/doc/something.pdf" type="application/pdf"></object>

<a href="{{site.baseurl}}/doc/something.pdf> download pdf </a>
```




- 
