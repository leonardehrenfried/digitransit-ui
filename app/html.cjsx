React = require 'react'
config = require './config'

class Application extends React.Component
  render: ->
    configPath = config.CONFIG
    root = config.APP_PATH

    <html lang="fi">
    <head>
      <meta charSet="utf-8"/>
      <meta httpEquiv="x-ua-compatible" content="ie=edge"/>
      <meta httpEquiv="Content-Language" content="fi"/>
      <title>{config.title}</title>
      <meta name="description" content=""/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimal-ui"/>
      <meta name="mobile-web-app-capable" content="yes"/>
      <meta name="apple-mobile-web-app-capable" content="yes"/>
      <link rel="apple-touch-startup-image" href="#{root}/img/#{configPath}-icons/ios-splash-screen.png"/>
      <link rel="apple-touch-icon" sizes="57x57" href="#{root}/img/#{configPath}-icons/apple-icon-57x57.png"/>
      <link rel="apple-touch-icon" sizes="60x60" href="#{root}/img/#{configPath}-icons/apple-icon-60x60.png"/>
      <link rel="apple-touch-icon" sizes="72x72" href="#{root}/img/#{configPath}-icons/apple-icon-72x72.png"/>
      <link rel="apple-touch-icon" sizes="76x76" href="#{root}/img/#{configPath}-icons/apple-icon-76x76.png"/>
      <link rel="apple-touch-icon" sizes="114x114" href="#{root}/img/#{configPath}-icons/apple-icon-114x114.png"/>
      <link rel="apple-touch-icon" sizes="120x120" href="#{root}/img/#{configPath}-icons/apple-icon-120x120.png"/>
      <link rel="apple-touch-icon" sizes="144x144" href="#{root}/img/#{configPath}-icons/apple-icon-144x144.png"/>
      <link rel="apple-touch-icon" sizes="152x152" href="#{root}/img/#{configPath}-icons/apple-icon-152x152.png"/>
      <link rel="apple-touch-icon" sizes="180x180" href="#{root}/img/#{configPath}-icons/apple-icon-180x180.png"/>
      <link rel="icon" type="image/png" sizes="192x192"  href="#{root}/img/#{configPath}-icons/android-icon-192x192.png"/>
      <link rel="icon" type="image/png" sizes="32x32" href="#{root}/img/#{configPath}-icons/favicon-32x32.png"/>
      <link rel="icon" type="image/png" sizes="96x96" href="#{root}/img/#{configPath}-icons/favicon-96x96.png"/>
      <link rel="icon" type="image/png" sizes="16x16" href="#{root}/img/#{configPath}-icons/favicon-16x16.png"/>
      <link rel="manifest" href="#{root}/manifest.#{configPath}.json"/>
      <meta name="msapplication-config" content="#{root}/browserconfig.#{configPath}.xml"/>
      <meta name="msapplication-TileColor" content="#{config.colors.primary}"/>
      <meta name="msapplication-TileImage" content="#{root}/img/#{configPath}-icons/ms-icon-144x144.png"/>
      <meta name="theme-color" content="#{config.colors.primary}"/>
      <meta property="og:url" content="#{root}/" />
      <meta property="og:type" content="website" />
      <meta property="og:title" content={config.socialMedia.title} />
      <meta property="og:site_name" content={config.socialMedia.title} />
      <meta property="og:description" content={config.socialMedia.description} />
      <meta property="og:image" content="#{root}/img/#{configPath}-icons/social-share.png"/>
      <meta property="og:locale" content="fi_FI" />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:site" content="@hsldevcom" />
      <meta name="twitter:title" content={config.socialMedia.title} />
      <meta name="twitter:description" content={config.socialMedia.description} />
      <meta name="twitter:image" content="#{root}/img/#{configPath}-icons/social-share.png"/>
      <style dangerouslySetInnerHTML={ __html: @props.fonts }/>
      {@props.css}
    </head>
    <body>
        <div style={{visibility: "hidden"}} dangerouslySetInnerHTML={ __html: @props.svgSprite }/>
        <div id="app" style={{height: "100%"}} dangerouslySetInnerHTML={ __html: @props.content } ></div>
        <script dangerouslySetInnerHTML={ __html: @props.polyfill }/>
        <script dangerouslySetInnerHTML={ __html: @props.state }/>
        <script dangerouslySetInnerHTML={ __html: @props.config }/>
        <script dangerouslySetInnerHTML={ __html: @props.locale }/>
        {@props.scripts}
      </body>
    </html>

module.exports = Application
