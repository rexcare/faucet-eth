import React from 'react';
import { render, screen } from '@testing-library/react';
import App from '../App.js';

test('render h1 element', () => {
    render(<App />);
    expect(screen.getByText('faucet')).toBeInTheDocument();
});
