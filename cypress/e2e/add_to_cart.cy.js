describe('Add to cart', () => {
  it('should add products to the cart', () => {
    cy.visit('/');
    cy.get(".products article").should("be.visible");
    cy.contains("My Cart (0)").should("be.visible");
    cy.get("article").first().contains("Add").click();
    cy.contains("My Cart (1)").should("be.visible");
  });
});
