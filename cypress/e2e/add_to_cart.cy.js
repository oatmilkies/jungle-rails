describe('Add to cart', () => {
  it('should add products to the cart', () => {
    cy.visit('/');
    // products should be visible
    cy.get(".products article").should("be.visible");
    // cart should be empty
    cy.contains("My Cart (0)").should("be.visible");
    // add a product
    cy.get("article").first().contains("Add").click();
    // cart qty updated to 1
    cy.contains("My Cart (1)").should("be.visible");
  });
});
