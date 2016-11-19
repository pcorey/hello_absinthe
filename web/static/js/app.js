import ApolloClient from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import React from "react";
import ReactDOM from "react-dom";

import PostList from "./PostList.jsx";

// By default, this client will send queries to the
//  `/graphql` endpoint on the same host
const client = new ApolloClient();

ReactDOM.render(
  <ApolloProvider client={client}>
    <PostList />
  </ApolloProvider>,
  document.getElementById("app")
);
