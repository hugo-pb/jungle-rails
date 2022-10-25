describe("Navigation", () => {
  it("should visit root", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get("span").contains("Giant Tea").click();
  });
});
