import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, receivePokemon, requestPokemon } from './actions/pokemon_actions';
import * as APIUtil from './util/api_util';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from 'react-router-dom';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  let store = configureStore();
  ReactDOM.render(<Root store = {store}/>, rootEl);
  window.requestPokemon = requestPokemon;
  // window.fetchPokemon = APIUtil.fetchPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});