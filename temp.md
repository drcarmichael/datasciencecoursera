% README
% M.Carmichael
% Sat Dec  3 22:54:28 2016

<!---  comment

images ![Title of image](image location)
calling R code ```{r}   Code chunk ```
[link title](http://www.bing.com)
i spend so much time at [link tag][1] of [link tag2][2]
later in doc
[1]: http://www.bing.com
[2]: http://www.google.com

newlines  require a double space at the end

Markdown Headers
# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

Emphasis
*Italic*

**Bold**

Strikethrough
~~Strikethrough~~

Markdown Link
[Link Text](http://google.com)

Markdown Image
![Alt Text](/path/to/image.jpg)

![Alt Text](/path/to/image.jpg "Title")

Blockquotes
> Blockquote

>> Nested blockquote

Horizontal Rule
*** or --- or ___

Bulleted List
* Bulleted Item

- Bulleted Item

+ Bulleted Item

Numbered List
1. Numbered Item

2. Numbered Item

3. Numbered Item

Nested List
Dots indicate leading spaces

1. Numbered Item

⋅⋅* Bulleted Item   

⋅⋅* Bulleted Item   

2. Numbered Item

Code Blocks
Dots indicate leading spaces

This is an example of `inline code.`

```This is a fenced code block.```

⋅⋅⋅⋅This is also a fenced code block.

Markdown Table
|  Tables  |      Are      | Cool |
|----------|:-------------:|-----:|
| col 1 is |  left-aligned | $100 |
| col 2 is |    centered   |  $52 |
| col 3 is | right-aligned |   $9 |

Markdown Footnotes
Sentence with a footnote label [^1].

[^1]: Footnote content.

Escaping Characters
\*don't italicize this\*

Superscript and Subscript
32^nd^

H~2~O

Text Highlighting
==Text to be highlighted==

--->
```{r}
str(mtcars)
```
