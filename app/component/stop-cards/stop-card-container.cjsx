React                 = require 'react'
Relay                 = require 'react-relay'
queries               = require '../../queries'
DepartureListContainer = require './departure-list-container'
StopCard              = require './stop-card'
FavouriteStopsActions = require '../../action/favourite-stops-action'

class StopCardContainer extends React.Component
  @contextTypes:
    getStore: React.PropTypes.func.isRequired
    executeAction: React.PropTypes.func.isRequired

  componentDidMount: ->
    @context.getStore('FavouriteStopsStore').addChangeListener @onChange

  componentWillUnmount: ->
    @context.getStore('FavouriteStopsStore').removeChangeListener @onChange

  onChange: (id) =>
    if !id or id == @props.stop.gtfsId
      @forceUpdate()

  addFavouriteStop: (e) =>
    e.stopPropagation()
    @context.executeAction FavouriteStopsActions.addFavouriteStop, @props.stop.gtfsId

  render: =>
    <StopCard
      stop={@props.stop}
      distance={@props.distance}
      favourite={@context.getStore('FavouriteStopsStore').isFavourite(@props.stop.gtfsId)}
      addFavouriteStop={@addFavouriteStop}>
      <DepartureListContainer
        rowClasses="no-padding no-margin"
        showMissingRoutes={false}
        stop={@props.stop}
        departures={@props.departures}/>
    </StopCard>


module.exports = Relay.createContainer StopCardContainer,
  fragments: queries.StopCardContainerFragments
