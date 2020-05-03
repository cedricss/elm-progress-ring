# Progress ring with elm/svg

Add a progress ring to an Html view:

```elm
import Progress.Ring

view : Html msg
view =
    Progress.Ring.view
        { color = "#6c45bc"
        , progress = 0.75
        , stroke = 8
        , radius = 30
        }
```

If you are using elm-css, convert it to styled html with `Html.Styled.fromUnstyled`.

## Author

Cédric Soulas ([cedricsoulas.com/elm](https://cedricsoulas.com/elm))

## License

MIT
