describe('Home Page', () => {
  it('should visit the home page', () => {
    cy.visit('/');

    // products should be visible
    cy.get(".products article").should("be.visible");

    // 2 products should be visible
    cy.get('.products article').should('have.length', 2);
  });
});
