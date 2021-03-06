<!--
repo name: meals
description: Aplicativo de Cardápio de receitas, construído durante o estudo do módulo de Navegação & Múltiplas Telas - Flutter
github name:  ayrongabriel
link: https://github.com/ayrongabriel/meals
logo path: assets/images/logo.png
screenshot: assets/screens/screen.gif
email: ayrongabriel@gmail.com
-->

<br />
<p align="center">
    <a href="LINK">
        <img src="assets/images/logo.png" alt="Logo" width="80" height="80">
    </a>
    <h3 align="center">Minhas Receitas</h3>
</p>
<br><br>


## Tabela de Conteúdo

* [Sobre](#sobre)
* [Color](#color)
* [Fontes](#fontes)
* [Packages](#packages)
* [Figma](#figma)
* [Screenshots](#screenshots)
* [Gif](#gif)


<br>

## Sobre

Projeto desenvolvido através do curso [Aprenda Flutter e Desenvolva Apps Para Android e IOS 2020 da Cod3r](https://www.udemy.com/course/curso-flutter/). 
<br>Módulo -  Navegação & Múltiplas Telas. <br>

O aplicativo mostra categorias de alimentos com várias refeições. Cada refeição tem seus detalhes como: resumo, igredientes, passo a passo, tempo gasto...

<br>

#### Conteúdo visto

- Navigator (pushNamed(), pushReplacementName(), pop()...)
- Tabs (Navegação em abas)
- Drawer (Perzonalizado)
- Passando dados via construtor
- Retornando dados a partir do Pop() e recuperando através do then().

<br>

#### Alterações

- Layout do aplicativo
- Add imagem e descrição no dummy_category
- Add variaveis description, imageUrl no Model de categoria.
- Tela de Splash simulando carregamento com ```Future.delayed```
- Animando de transição nos thumbnails com Widget Hero
- AddiIcone e nome no Launcher

<hr>

## Fontes
- [Raleway](https://fonts.google.com/specimen/Raleway#standard-styles)
- [Roboto Condensed](https://fonts.google.com/specimen/Roboto+Condensed?query=Roboto+Condensed)

<hr>

## Color
```dart
static const primary = Color(0xFFFF8527);
static const secondary = Color(0xFFFFB945);
static const white = Colors.white;
static const background = Color(0xFFF2F3F4);
static const border = Color(0xFFE1E2E3);
```
<hr>

## Packages
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

<hr>

## Figma
[Mallika UI Kit](https://www.figma.com/file/Fm5uF9Ge6LmcDChr6Aj7v5/Mallika-UI-Kit-Community)

<hr>

## Screenshots

<img src='assets/screens/0.jpg' width=200> <img src='assets/screens/1.jpg' width=200> <img src='assets/screens/2.jpg' width=200> <img src='assets/screens/3.jpg' width=200> <img src='assets/screens/4.jpg' width=200> <img src='assets/screens/5.jpg' width=200> <img src='assets/screens/cat.jpg' width=200> <img src='assets/screens/cat-1.jpg' width=200> <img src='assets/screens/cat-2.jpg' width=200> <img src='assets/screens/drawer.jpg' width=200> <img src='assets/screens/favorites.jpg' width=200> <img src='assets/screens/settings.jpg' width=200> 
<hr>

## Gif
<p align="center">
<img src='assets/screens/screen.gif' width=200>
</p>

<hr>

## License

Distributed under the MIT License. See `LICENSE` for more information.